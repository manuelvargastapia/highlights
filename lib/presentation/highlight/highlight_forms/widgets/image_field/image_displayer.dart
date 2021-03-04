import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';

import 'package:animations/animations.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/highlights/image.dart' as d;

class ImageDisplayer extends StatelessWidget {
  final Option<d.Image> _image;
  final Size _size;

  const ImageDisplayer(this._image, this._size);

  @override
  Widget build(BuildContext context) {
    return _image.fold(
      () => _sizedBoxWrap(const Center(child: Text('NO IMAGE'))),
      (image) {
        // TODO: cache image
        final loadedImage = _loadImage(image);

        return image.failureOption.fold(
          () => OpenContainer(
            closedElevation: 8,
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: const Duration(milliseconds: 600),
            closedBuilder: (context, _) => _sizedBoxWrap(loadedImage),
            openBuilder: (context, _) => loadedImage,
          ),
          (failure) => _sizedBoxWrap(
            Center(
              child: Text(
                failure.maybeMap(
                  invalidUrl: (_) =>
                      'Error loading image. Try again later, please.',
                  orElse: () => 'Unexpect error. Try again later, please.',
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _sizedBoxWrap(Widget content) {
    return SizedBox(
      width: _size.width * 0.6,
      height: _size.height * 0.2,
      child: content,
    );
  }

  Image _loadImage(d.Image domainImage) {
    Widget frameBuilder(
      BuildContext context,
      Widget child,
      int frame,
      // ignore: avoid_positional_boolean_parameters
      bool wasSynchronouslyLoaded,
    ) =>
        wasSynchronouslyLoaded
            ? child
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: frame != null ? child : const Text('Loading...'),
              );

    Widget errorBuilder(
      BuildContext context,
      Object error,
      StackTrace stackTrace,
    ) =>
        const Center(child: Text('Error loading image.'));

    return domainImage.isUploaded
        ? Image.network(
            domainImage.imageUrl
                .getOrElse(() => throw UnexpectedUIError())
                .getOrCrash(),
            frameBuilder: frameBuilder,
            errorBuilder: errorBuilder,
          )
        : Image.file(
            domainImage.imageFile
                .getOrElse(() => throw UnexpectedUIError())
                .getOrCrash(),
            frameBuilder: frameBuilder,
            errorBuilder: errorBuilder,
          );
  }
}
