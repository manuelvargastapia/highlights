import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kt_dart/collection.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/routes/router.gr.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/image_field/image_displayer.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

class ImageField extends StatelessWidget {
  const ImageField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFormBloc, HighlightFormState>(
      buildWhen: (prev, curr) => prev.highlight != curr.highlight,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: state.highlight.color.getOrCrash(),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Column(
            children: [
              ImageDisplayer(
                state.highlight.image,
                MediaQuery.of(context).size,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      final filesPair = await showDialog<KtPair<File, File>>(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: const Text('Load a picture'),
                            children: [
                              SimpleDialogOption(
                                onPressed: () async {
                                  final filesPair = await _getFilesPair(
                                    context,
                                    ImageSource.gallery,
                                  );
                                  Navigator.pop(context, filesPair);
                                },
                                child: const Text('Gallery'),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  final filesPair = await _getFilesPair(
                                    context,
                                    ImageSource.camera,
                                  );
                                  Navigator.pop(context, filesPair);
                                },
                                child: const Text('Camera'),
                              ),
                            ],
                          );
                        },
                      );

                      // "file" is null when showDialog() is dismissed
                      if (filesPair != null) {
                        ExtendedNavigator.of(context).pushTextRecognitionPage(
                          originalImage: ImagePrimitive.fromFile(
                            filesPair.first,
                          ),
                          croppedImage: ImagePrimitive.fromFile(
                            filesPair.second,
                          ),
                          formBloc: context.read<HighlightFormBloc>(),
                        );
                      }
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                  if (state.highlight.image.isSome())
                    IconButton(
                      onPressed: () {
                        _showDeletionDialog(
                          context,
                          context.read<HighlightFormBloc>(),
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future<KtPair<File, File>> _getFilesPair(
    BuildContext context,
    ImageSource source,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: source,
      imageQuality: 50,
    );
    // "pickedFile" is null when user comes back from imnage selection
    // screen using hardware back button (Android)
    if (pickedFile == null) {
      return null;
    }

    final croppedFile = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      compressQuality: 50,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Edit image',
        toolbarColor: Theme.of(context).primaryColor,
        toolbarWidgetColor: Colors.white,
        activeControlsWidgetColor: Theme.of(context).accentColor,
        initAspectRatio: CropAspectRatioPreset.original,
        hideBottomControls: true,
        lockAspectRatio: false,
      ),
    );

    return KtPair(File(pickedFile.path), croppedFile);
  }

  void _showDeletionDialog(
    BuildContext context,
    HighlightFormBloc bloc,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete image'),
          content: const Text(
            'Associated quote will NOT be deleted',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                bloc.add(const HighlightFormEvent.imageDeleted());

                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}
