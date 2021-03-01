import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

class ImageUrlField extends StatelessWidget {
  const ImageUrlField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HighlightActorBloc, HighlightActorState>(
          listener: (context, state) {
            state.maybeMap(
              actionInProgress: (_) {
                // TODO: show Flushbar
              },
              uploadImageFailure: (_) {
                // TODO: show Flushbar
              },
              uploadImageSuccess: (state) {
                context
                    .read<HighlightFormBloc>()
                    .add(HighlightFormEvent.imageChanged(state.image));
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [BoxShadow(color: Colors.blueAccent)],
        ),
        child: Column(
          children: [
            BlocBuilder<HighlightFormBloc, HighlightFormState>(
              builder: (context, state) {
                // TODO: imrpove validation
                final imageUrl = state.highlight.image.imageUrl.getOrCrash();
                if (imageUrl.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.only(top: 8),
                    width: 200,
                    height: 200,
                    child: const Text('NO IMAGE'),
                  );
                }

                return Container(
                  padding: const EdgeInsets.only(top: 8),
                  width: 200,
                  height: 200,
                  child: Image.network(imageUrl),
                );
              },
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

                context
                    .read<HighlightActorBloc>()
                    .add(HighlightActorEvent.imageUploaded(
                      ImagePrimitive.fromFile(file),
                    ));
              },
              icon: const Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
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
