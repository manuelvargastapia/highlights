import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/highlights/image.dart' as d;

class ImageDisplayer extends StatelessWidget {
  final d.Image _image;

  const ImageDisplayer(this._image);

  @override
  Widget build(BuildContext context) {
    // TODO: cache image
    final loadedImage = _loadImage(_image);

    return _image.failureOption.fold(
      () => OpenContainer(
        closedElevation: 4,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        openColor: Theme.of(context).scaffoldBackgroundColor,
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 600),
        closedBuilder: (context, _) => _loadedImageContainer(loadedImage),
        openBuilder: (context, _) => loadedImage,
      ),
      (failure) => Material(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const SizedBox(
          height: 200,
          child: Center(
            child: Image(
              image: AssetImage('assets/error_loading_file.png'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadedImageContainer(Image image) {
    return Center(child: image);
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
                child: frame != null
                    ? child
                    : SizedBox(
                        height: 200,
                        child: SpinKitDoubleBounce(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
              );

    Widget errorBuilder(
      BuildContext context,
      Object error,
      StackTrace stackTrace,
    ) =>
        // TODO: show funny image
        const SizedBox(
          height: 200,
          child: Center(child: Text('Error loading image.')),
        );

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
