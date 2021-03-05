import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:highlights/domain/text_recognition/text_recognition_result.dart';
import 'package:highlights/domain/text_recognition/text_recognition_failure.dart';
import 'package:highlights/domain/text_recognition/i_text_recognition_repository.dart';
import 'package:highlights/presentation/highlight/highlight_forms/core/image_presentation_class.dart';

part 'image_processer_event.dart';
part 'image_processer_state.dart';
part 'image_processer_bloc.freezed.dart';

@injectable
class ImageProcesserBloc
    extends Bloc<ImageProcesserEvent, ImageProcesserState> {
  final ITextRecognitionRepository _textRecognitionRepository;

  ImageProcesserBloc(this._textRecognitionRepository)
      : super(const ImageProcesserState.initial());

  @override
  Stream<ImageProcesserState> mapEventToState(
    ImageProcesserEvent event,
  ) async* {
    yield* event.map(
      processImageStarted: (event) async* {
        yield const ImageProcesserState.processingImage();

        final image = event.image.toDomain();

        final failureOrSize =
            await _textRecognitionRepository.getImageSize(image);

        yield* failureOrSize.fold(
          (failure) async* {
            yield ImageProcesserState.processingFailure(failure);
          },
          (size) async* {
            final failureOrText =
                await _textRecognitionRepository.extratTextFromImage(
              image,
            );
            yield failureOrText.fold(
              (failure) => ImageProcesserState.processingFailure(failure),
              (result) => ImageProcesserState.processingSuccess(
                result.copyWith(imageSize: some(size)),
              ),
            );
          },
        );
      },
    );
  }
}
