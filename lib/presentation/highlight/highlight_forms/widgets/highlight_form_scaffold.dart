import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart' hide Image;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:kt_dart/kt.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/book_title_field.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/color_field.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/image_field/image_field.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/page_number_field.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/quote_field.dart';
import 'package:highlights/presentation/core/widgets/fab_animated_menu/fab_animated_menu.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

class HighlightFormScaffold extends StatelessWidget {
  /// This property must be `static` to avoid build loop
  ///
  /// See https://github.com/flutter/flutter/issues/20042
  static final _formKey = GlobalKey<FormState>(); // TODO: may not be necessary

  const HighlightFormScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFormBloc, HighlightFormState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.isEditing ? 'Edit Highlight' : 'Create Highlight',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _formKey.currentState.validate();

                  context
                      .read<HighlightFormBloc>()
                      .add(const HighlightFormEvent.saved());
                },
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(flex: 3, child: BookTitleField()),
                      Expanded(flex: 2, child: PageNumberField()),
                    ],
                  ),
                  const ColorField(),
                  const SizedBox(height: 16),
                  const QuoteField(),
                  state.highlight.image.fold(
                    () => const SizedBox(),
                    (image) => ImageField(image),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FABAnimatedMenu(
            baseButtonColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            buttons: [
              FloatingActionButton(
                elevation: 0,
                heroTag: '1',
                onPressed: () async {
                  final filesPair = await _getFilesPair(
                    context,
                    ImageSource.gallery,
                  );
                  if (filesPair != null) {
                    _navigateToTextRecognitionPage(context, filesPair);
                  }
                },
                child: const Icon(
                  Icons.add_photo_alternate,
                  size: 26,
                ),
              ),
              FloatingActionButton(
                heroTag: '2',
                elevation: 0,
                onPressed: () async {
                  final filesPair = await _getFilesPair(
                    context,
                    ImageSource.camera,
                  );
                  if (filesPair != null) {
                    _navigateToTextRecognitionPage(context, filesPair);
                  }
                },
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 26,
                  ),
                ),
              ),
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
    // "pickedFile" is null when user comes back from image selection
    // screen using hardware back button (Android)
    if (pickedFile == null) {
      return null;
    }

    final croppedFile = await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      compressQuality: 50,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        cropFrameColor: Theme.of(context).accentColor,
        cropGridColor: Theme.of(context).accentColor,
        toolbarColor: Theme.of(context).primaryColor,
        cropFrameStrokeWidth: 4,
        cropGridStrokeWidth: 4,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        hideBottomControls: true,
        lockAspectRatio: false,
      ),
    );

    return KtPair(File(pickedFile.path), croppedFile);
  }

  void _navigateToTextRecognitionPage(
    BuildContext context,
    KtPair<File, File> filesPair,
  ) {
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
}
