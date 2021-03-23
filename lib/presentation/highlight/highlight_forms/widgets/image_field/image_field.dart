import 'package:flutter/material.dart' hide Image;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animations/animations.dart';

import 'package:highlights/domain/highlights/image.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/image_field/image_displayer.dart';

class ImageField extends StatelessWidget {
  final Image _image;

  const ImageField(this._image, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.image,
                    color: Theme.of(context).backgroundColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Image',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  _showDeletionDialog(
                    context,
                    context.read<HighlightFormBloc>(),
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ImageDisplayer(_image),
          ),
        ],
      ),
    );
  }

  void _showDeletionDialog(
    BuildContext context,
    HighlightFormBloc bloc,
  ) {
    showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
      ),
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text(
            'Associated quote will NOT be deleted',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
