// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'text_recognition_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TextRecognitionResultTearOff {
  const _$TextRecognitionResultTearOff();

// ignore: unused_element
  _TextRecognitionResult call(
      {@required RecognizedText recognizedText,
      @required ImmutableList<RecognizedTextElement> recognizedElements,
      @required Option<ImageSize> imageSize}) {
    return _TextRecognitionResult(
      recognizedText: recognizedText,
      recognizedElements: recognizedElements,
      imageSize: imageSize,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TextRecognitionResult = _$TextRecognitionResultTearOff();

/// @nodoc
mixin _$TextRecognitionResult {
  RecognizedText get recognizedText;
  ImmutableList<RecognizedTextElement> get recognizedElements;
  Option<ImageSize> get imageSize;

  @JsonKey(ignore: true)
  $TextRecognitionResultCopyWith<TextRecognitionResult> get copyWith;
}

/// @nodoc
abstract class $TextRecognitionResultCopyWith<$Res> {
  factory $TextRecognitionResultCopyWith(TextRecognitionResult value,
          $Res Function(TextRecognitionResult) then) =
      _$TextRecognitionResultCopyWithImpl<$Res>;
  $Res call(
      {RecognizedText recognizedText,
      ImmutableList<RecognizedTextElement> recognizedElements,
      Option<ImageSize> imageSize});
}

/// @nodoc
class _$TextRecognitionResultCopyWithImpl<$Res>
    implements $TextRecognitionResultCopyWith<$Res> {
  _$TextRecognitionResultCopyWithImpl(this._value, this._then);

  final TextRecognitionResult _value;
  // ignore: unused_field
  final $Res Function(TextRecognitionResult) _then;

  @override
  $Res call({
    Object recognizedText = freezed,
    Object recognizedElements = freezed,
    Object imageSize = freezed,
  }) {
    return _then(_value.copyWith(
      recognizedText: recognizedText == freezed
          ? _value.recognizedText
          : recognizedText as RecognizedText,
      recognizedElements: recognizedElements == freezed
          ? _value.recognizedElements
          : recognizedElements as ImmutableList<RecognizedTextElement>,
      imageSize: imageSize == freezed
          ? _value.imageSize
          : imageSize as Option<ImageSize>,
    ));
  }
}

/// @nodoc
abstract class _$TextRecognitionResultCopyWith<$Res>
    implements $TextRecognitionResultCopyWith<$Res> {
  factory _$TextRecognitionResultCopyWith(_TextRecognitionResult value,
          $Res Function(_TextRecognitionResult) then) =
      __$TextRecognitionResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecognizedText recognizedText,
      ImmutableList<RecognizedTextElement> recognizedElements,
      Option<ImageSize> imageSize});
}

/// @nodoc
class __$TextRecognitionResultCopyWithImpl<$Res>
    extends _$TextRecognitionResultCopyWithImpl<$Res>
    implements _$TextRecognitionResultCopyWith<$Res> {
  __$TextRecognitionResultCopyWithImpl(_TextRecognitionResult _value,
      $Res Function(_TextRecognitionResult) _then)
      : super(_value, (v) => _then(v as _TextRecognitionResult));

  @override
  _TextRecognitionResult get _value => super._value as _TextRecognitionResult;

  @override
  $Res call({
    Object recognizedText = freezed,
    Object recognizedElements = freezed,
    Object imageSize = freezed,
  }) {
    return _then(_TextRecognitionResult(
      recognizedText: recognizedText == freezed
          ? _value.recognizedText
          : recognizedText as RecognizedText,
      recognizedElements: recognizedElements == freezed
          ? _value.recognizedElements
          : recognizedElements as ImmutableList<RecognizedTextElement>,
      imageSize: imageSize == freezed
          ? _value.imageSize
          : imageSize as Option<ImageSize>,
    ));
  }
}

/// @nodoc
class _$_TextRecognitionResult extends _TextRecognitionResult {
  const _$_TextRecognitionResult(
      {@required this.recognizedText,
      @required this.recognizedElements,
      @required this.imageSize})
      : assert(recognizedText != null),
        assert(recognizedElements != null),
        assert(imageSize != null),
        super._();

  @override
  final RecognizedText recognizedText;
  @override
  final ImmutableList<RecognizedTextElement> recognizedElements;
  @override
  final Option<ImageSize> imageSize;

  @override
  String toString() {
    return 'TextRecognitionResult(recognizedText: $recognizedText, recognizedElements: $recognizedElements, imageSize: $imageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TextRecognitionResult &&
            (identical(other.recognizedText, recognizedText) ||
                const DeepCollectionEquality()
                    .equals(other.recognizedText, recognizedText)) &&
            (identical(other.recognizedElements, recognizedElements) ||
                const DeepCollectionEquality()
                    .equals(other.recognizedElements, recognizedElements)) &&
            (identical(other.imageSize, imageSize) ||
                const DeepCollectionEquality()
                    .equals(other.imageSize, imageSize)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recognizedText) ^
      const DeepCollectionEquality().hash(recognizedElements) ^
      const DeepCollectionEquality().hash(imageSize);

  @JsonKey(ignore: true)
  @override
  _$TextRecognitionResultCopyWith<_TextRecognitionResult> get copyWith =>
      __$TextRecognitionResultCopyWithImpl<_TextRecognitionResult>(
          this, _$identity);
}

abstract class _TextRecognitionResult extends TextRecognitionResult {
  const _TextRecognitionResult._() : super._();
  const factory _TextRecognitionResult(
      {@required RecognizedText recognizedText,
      @required ImmutableList<RecognizedTextElement> recognizedElements,
      @required Option<ImageSize> imageSize}) = _$_TextRecognitionResult;

  @override
  RecognizedText get recognizedText;
  @override
  ImmutableList<RecognizedTextElement> get recognizedElements;
  @override
  Option<ImageSize> get imageSize;
  @override
  @JsonKey(ignore: true)
  _$TextRecognitionResultCopyWith<_TextRecognitionResult> get copyWith;
}
