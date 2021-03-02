import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/image_field/image_displayer.dart';

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

                  // "file" is null when showDialog() is dismissed
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
