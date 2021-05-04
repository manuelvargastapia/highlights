part of 'image_processer_bloc.dart';

@freezed
abstract class ImageProcesserEvent with _$ImageProcesserEvent {
  const factory ImageProcesserEvent.processImageStarted(ImagePrimitive image) =
      _ProcessImageStarted;
}
