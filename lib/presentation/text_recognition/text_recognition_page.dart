import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flushbar/flushbar_helper.dart';

import 'package:highlights/domain/core/errors.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/application/text_recognition/image_processer_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';
import 'package:highlights/presentation/text_recognition/widgets/recognized_text_painter.dart';

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
              formBloc.add(
                HighlightFormEvent.quoteChange(textEditingController.text),
              );

              ExtendedNavigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: BlocConsumer<ImageProcesserBloc, ImageProcesserState>(
        listener: (context, state) {
          state.maybeMap(
            processingFailure: (state) {
              FlushbarHelper.createError(
                message: state.failure.map(
                  unableToProcessImage: (_) => 'Unable to process image 😞',
                  noTextDetected: (_) => 'No text found in image 🤔',
                ),
              ).show(context);
            },
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
            processingSuccess: (state) => Stack(
              children: [
                Center(
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.black,
                    child: CustomPaint(
                      foregroundPainter: RecognizedTextPainter(
                        state.textRecognitionResult,
                      ),
                      child: AspectRatio(
                        aspectRatio: state.textRecognitionResult.imageSize
                            .getOrElse(() => throw UnexpectedUIError())
                            .getOrCrash()
                            .aspectRatio,
                        child: Image.file(croppedImage.imageFile),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            counterText: '',
                          ),
                          maxLength: HighlightQuote.maxLength,
                          maxLines: 5,
                          minLines: 5,
                          onChanged: (value) {
                            formBloc.add(
                              HighlightFormEvent.quoteChange(value),
                            );
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (_) => state
                              .textRecognitionResult.recognizedText.value
                              .fold(
                            (failure) => failure.maybeMap(
                              empty: (_) => 'Cannot be empty',
                              exceedingLength: (f) =>
                                  'Exceeding length. Max: ${f.max}',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // TODO: create specific error screen widget
            processingFailure: (_) => const Center(
              child: Text('ERROR'),
            ),
          );
        },
      ),
    );
  }
}
