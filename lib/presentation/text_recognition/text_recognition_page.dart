import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/application/text_recognition/image_processer_bloc.dart';
import 'package:highlights/domain/text_recognition/value_objects.dart';
import 'package:highlights/presentation/core/widgets/core_text_form_field.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';
import 'package:highlights/presentation/text_recognition/widgets/recognized_text_painter.dart';
import 'package:highlights/presentation/text_recognition/widgets/text_recognition_failure_display.dart';

class TextRecognitionPage extends HookWidget {
  final ImagePrimitive originalImage;
  final ImagePrimitive croppedImage;
  final HighlightFormBloc formBloc;

  const TextRecognitionPage({
    @required this.originalImage,
    @required this.croppedImage,
    @required this.formBloc,
  });

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    // ignore: missing_return
    useEffect(() {
      context
          .read<ImageProcesserBloc>()
          .add(ImageProcesserEvent.processImageStarted(croppedImage));
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Scanning'),
        actions: [
          IconButton(
            onPressed: () {
              formBloc.add(HighlightFormEvent.imageChanged(originalImage));
              if (textEditingController.text.isNotEmpty) {
                formBloc.add(
                  HighlightFormEvent.quoteChangeByTextRecognition(
                    textEditingController.text,
                  ),
                );
              }

              ExtendedNavigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: BlocConsumer<ImageProcesserBloc, ImageProcesserState>(
        listener: (context, state) {
          state.maybeMap(
            processingSuccess: (state) {
              textEditingController.text =
                  state.textRecognitionResult.recognizedText.getOrCrash();
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            processingImage: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            processingSuccess: (state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Scanned Text',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                        ),
                        CoreTextFormField(
                          controller: textEditingController,
                          counterText: '',
                          borderRadius: 16,
                          contentPadding: const EdgeInsets.all(16),
                          maxLength: RecognizedText.maxLength,
                          maxLines: 10,
                          minLines: 10,
                          validator: (_) => state
                              .textRecognitionResult.recognizedText.value
                              .fold(
                            (failure) => failure.maybeMap(
                              empty: (_) => 'Required',
                              exceedingLength: (f) =>
                                  'Exceeding length. Max: ${f.max}',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    CustomPaint(
                      foregroundPainter: RecognizedTextPainter(
                        state.textRecognitionResult,
                      ),
                      child: AspectRatio(
                        aspectRatio: state.textRecognitionResult.imageSize
                            .getOrElse(() => throw UnexpectedUIError())
                            .getOrCrash()
                            .aspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(croppedImage.imageFile),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            processingFailure: (state) =>
                TextRecognitionFailureDisplay(failure: state.failure),
          );
        },
      ),
    );
  }
}
