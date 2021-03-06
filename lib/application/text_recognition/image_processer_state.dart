part of 'image_processer_bloc.dart';

@freezed
abstract class ImageProcesserState with _$ImageProcesserState {
  const factory ImageProcesserState.initial() = _Initial;
  const factory ImageProcesserState.processingImage() = _ProcessingImage;
  const factory ImageProcesserState.processingSuccess(
    TextRecognitionResult textRecognitionResult,
  ) = _ProcessingSuccess;
  const factory ImageProcesserState.processingFailure(
    TextRecognitionFailure failure,
  ) = _ProcessingFailure;
}
