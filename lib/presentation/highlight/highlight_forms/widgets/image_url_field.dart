import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

class ImageUrlField extends StatelessWidget {
  const ImageUrlField({Key key}) : super(key: key);

  // TODO: refactor
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFormBloc, HighlightFormState>(
      builder: (context, state) {
        final image = state.highlight.image;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: const [
              BoxShadow(color: Colors.blueAccent),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 8),
                width: 200,
                height: 200,
                child: image.fold(
                  () => const Center(child: Text('NO IMAGE')),
                  (image) => image.failureOption.fold(
                    () => image.uploaded
                        ? Image.network(
                            image.imageUrl
                                .getOrElse(() => throw UnexpectedUIError())
                                .getOrCrash(),
                          )
                        : Image.file(
                            image.imageFile
                                .getOrElse(() => throw UnexpectedUIError())
                                .getOrCrash(),
                          ),
                    (failure) => const Center(child: Text('Image error')),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  final file = await showDialog<File>(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text('Load a picture'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () async {
                              final file = await _getImage(ImageSource.gallery);
                              Navigator.pop(context, file);
                            },
                            child: const Text('Gallery'),
                          ),
                          SimpleDialogOption(
                            onPressed: () async {
                              final file = await _getImage(ImageSource.camera);
                              Navigator.pop(context, file);
                            },
                            child: const Text('Camera'),
                          ),
                        ],
                      );
                    },
                  );

                  if (file != null) {
                    context
                        .read<HighlightFormBloc>()
                        .add(HighlightFormEvent.imageChanged(
                          ImagePrimitive.fromFile(file),
                        ));
                  }
                },
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<File> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: source,
      // TODO: use or remove: imageQuality: 80, --> Reduce size
    );
    return File(pickedFile.path);
  }
}
