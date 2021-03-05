// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_processer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ImageProcesserEventTearOff {
  const _$ImageProcesserEventTearOff();

// ignore: unused_element
  _ProcessImageStarted processImageStarted(ImagePrimitive image) {
    return _ProcessImageStarted(
      image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ImageProcesserEvent = _$ImageProcesserEventTearOff();

/// @nodoc
mixin _$ImageProcesserEvent {
  ImagePrimitive get image;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult processImageStarted(ImagePrimitive image),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult processImageStarted(ImagePrimitive image),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult processImageStarted(_ProcessImageStarted value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult processImageStarted(_ProcessImageStarted value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ImageProcesserEventCopyWith<ImageProcesserEvent> get copyWith;
}

/// @nodoc
abstract class $ImageProcesserEventCopyWith<$Res> {
  factory $ImageProcesserEventCopyWith(
          ImageProcesserEvent value, $Res Function(ImageProcesserEvent) then) =
      _$ImageProcesserEventCopyWithImpl<$Res>;
  $Res call({ImagePrimitive image});

  $ImagePrimitiveCopyWith<$Res> get image;
}

/// @nodoc
class _$ImageProcesserEventCopyWithImpl<$Res>
    implements $ImageProcesserEventCopyWith<$Res> {
  _$ImageProcesserEventCopyWithImpl(this._value, this._then);

  final ImageProcesserEvent _value;
  // ignore: unused_field
  final $Res Function(ImageProcesserEvent) _then;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed ? _value.image : image as ImagePrimitive,
    ));
  }

  @override
  $ImagePrimitiveCopyWith<$Res> get image {
    if (_value.image == null) {
      return null;
    }
    return $ImagePrimitiveCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$ProcessImageStartedCopyWith<$Res>
    implements $ImageProcesserEventCopyWith<$Res> {
  factory _$ProcessImageStartedCopyWith(_ProcessImageStarted value,
          $Res Function(_ProcessImageStarted) then) =
      __$ProcessImageStartedCopyWithImpl<$Res>;
  @override
  $Res call({ImagePrimitive image});

  @override
  $ImagePrimitiveCopyWith<$Res> get image;
}

/// @nodoc
class __$ProcessImageStartedCopyWithImpl<$Res>
    extends _$ImageProcesserEventCopyWithImpl<$Res>
    implements _$ProcessImageStartedCopyWith<$Res> {
  __$ProcessImageStartedCopyWithImpl(
      _ProcessImageStarted _value, $Res Function(_ProcessImageStarted) _then)
      : super(_value, (v) => _then(v as _ProcessImageStarted));

  @override
  _ProcessImageStarted get _value => super._value as _ProcessImageStarted;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_ProcessImageStarted(
      image == freezed ? _value.image : image as ImagePrimitive,
    ));
  }
}

/// @nodoc
class _$_ProcessImageStarted implements _ProcessImageStarted {
  const _$_ProcessImageStarted(this.image) : assert(image != null);

  @override
  final ImagePrimitive image;

  @override
  String toString() {
    return 'ImageProcesserEvent.processImageStarted(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessImageStarted &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$ProcessImageStartedCopyWith<_ProcessImageStarted> get copyWith =>
      __$ProcessImageStartedCopyWithImpl<_ProcessImageStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult processImageStarted(ImagePrimitive image),
  }) {
    assert(processImageStarted != null);
    return processImageStarted(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult processImageStarted(ImagePrimitive image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processImageStarted != null) {
      return processImageStarted(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult processImageStarted(_ProcessImageStarted value),
  }) {
    assert(processImageStarted != null);
    return processImageStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult processImageStarted(_ProcessImageStarted value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processImageStarted != null) {
      return processImageStarted(this);
    }
    return orElse();
  }
}

abstract class _ProcessImageStarted implements ImageProcesserEvent {
  const factory _ProcessImageStarted(ImagePrimitive image) =
      _$_ProcessImageStarted;

  @override
  ImagePrimitive get image;
  @override
  @JsonKey(ignore: true)
  _$ProcessImageStartedCopyWith<_ProcessImageStarted> get copyWith;
}

/// @nodoc
class _$ImageProcesserStateTearOff {
  const _$ImageProcesserStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ProcessingImage processingImage() {
    return const _ProcessingImage();
  }

// ignore: unused_element
  _ProcessingSuccess processingSuccess(
      TextRecognitionResult textRecognitionResult) {
    return _ProcessingSuccess(
      textRecognitionResult,
    );
  }

// ignore: unused_element
  _ProcessingFailure processingFailure(TextRecognitionFailure failure) {
    return _ProcessingFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ImageProcesserState = _$ImageProcesserStateTearOff();

/// @nodoc
mixin _$ImageProcesserState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult processingImage(),
    @required
        TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    @required TResult processingFailure(TextRecognitionFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult processingImage(),
    TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    TResult processingFailure(TextRecognitionFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult processingImage(_ProcessingImage value),
    @required TResult processingSuccess(_ProcessingSuccess value),
    @required TResult processingFailure(_ProcessingFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult processingImage(_ProcessingImage value),
    TResult processingSuccess(_ProcessingSuccess value),
    TResult processingFailure(_ProcessingFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ImageProcesserStateCopyWith<$Res> {
  factory $ImageProcesserStateCopyWith(
          ImageProcesserState value, $Res Function(ImageProcesserState) then) =
      _$ImageProcesserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageProcesserStateCopyWithImpl<$Res>
    implements $ImageProcesserStateCopyWith<$Res> {
  _$ImageProcesserStateCopyWithImpl(this._value, this._then);

  final ImageProcesserState _value;
  // ignore: unused_field
  final $Res Function(ImageProcesserState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ImageProcesserStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ImageProcesserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult processingImage(),
    @required
        TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    @required TResult processingFailure(TextRecognitionFailure failure),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult processingImage(),
    TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    TResult processingFailure(TextRecognitionFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult processingImage(_ProcessingImage value),
    @required TResult processingSuccess(_ProcessingSuccess value),
    @required TResult processingFailure(_ProcessingFailure value),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult processingImage(_ProcessingImage value),
    TResult processingSuccess(_ProcessingSuccess value),
    TResult processingFailure(_ProcessingFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ImageProcesserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ProcessingImageCopyWith<$Res> {
  factory _$ProcessingImageCopyWith(
          _ProcessingImage value, $Res Function(_ProcessingImage) then) =
      __$ProcessingImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$ProcessingImageCopyWithImpl<$Res>
    extends _$ImageProcesserStateCopyWithImpl<$Res>
    implements _$ProcessingImageCopyWith<$Res> {
  __$ProcessingImageCopyWithImpl(
      _ProcessingImage _value, $Res Function(_ProcessingImage) _then)
      : super(_value, (v) => _then(v as _ProcessingImage));

  @override
  _ProcessingImage get _value => super._value as _ProcessingImage;
}

/// @nodoc
class _$_ProcessingImage implements _ProcessingImage {
  const _$_ProcessingImage();

  @override
  String toString() {
    return 'ImageProcesserState.processingImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ProcessingImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult processingImage(),
    @required
        TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    @required TResult processingFailure(TextRecognitionFailure failure),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingImage();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult processingImage(),
    TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    TResult processingFailure(TextRecognitionFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingImage != null) {
      return processingImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult processingImage(_ProcessingImage value),
    @required TResult processingSuccess(_ProcessingSuccess value),
    @required TResult processingFailure(_ProcessingFailure value),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult processingImage(_ProcessingImage value),
    TResult processingSuccess(_ProcessingSuccess value),
    TResult processingFailure(_ProcessingFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingImage != null) {
      return processingImage(this);
    }
    return orElse();
  }
}

abstract class _ProcessingImage implements ImageProcesserState {
  const factory _ProcessingImage() = _$_ProcessingImage;
}

/// @nodoc
abstract class _$ProcessingSuccessCopyWith<$Res> {
  factory _$ProcessingSuccessCopyWith(
          _ProcessingSuccess value, $Res Function(_ProcessingSuccess) then) =
      __$ProcessingSuccessCopyWithImpl<$Res>;
  $Res call({TextRecognitionResult textRecognitionResult});

  $TextRecognitionResultCopyWith<$Res> get textRecognitionResult;
}

/// @nodoc
class __$ProcessingSuccessCopyWithImpl<$Res>
    extends _$ImageProcesserStateCopyWithImpl<$Res>
    implements _$ProcessingSuccessCopyWith<$Res> {
  __$ProcessingSuccessCopyWithImpl(
      _ProcessingSuccess _value, $Res Function(_ProcessingSuccess) _then)
      : super(_value, (v) => _then(v as _ProcessingSuccess));

  @override
  _ProcessingSuccess get _value => super._value as _ProcessingSuccess;

  @override
  $Res call({
    Object textRecognitionResult = freezed,
  }) {
    return _then(_ProcessingSuccess(
      textRecognitionResult == freezed
          ? _value.textRecognitionResult
          : textRecognitionResult as TextRecognitionResult,
    ));
  }

  @override
  $TextRecognitionResultCopyWith<$Res> get textRecognitionResult {
    if (_value.textRecognitionResult == null) {
      return null;
    }
    return $TextRecognitionResultCopyWith<$Res>(_value.textRecognitionResult,
        (value) {
      return _then(_value.copyWith(textRecognitionResult: value));
    });
  }
}

/// @nodoc
class _$_ProcessingSuccess implements _ProcessingSuccess {
  const _$_ProcessingSuccess(this.textRecognitionResult)
      : assert(textRecognitionResult != null);

  @override
  final TextRecognitionResult textRecognitionResult;

  @override
  String toString() {
    return 'ImageProcesserState.processingSuccess(textRecognitionResult: $textRecognitionResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessingSuccess &&
            (identical(other.textRecognitionResult, textRecognitionResult) ||
                const DeepCollectionEquality().equals(
                    other.textRecognitionResult, textRecognitionResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(textRecognitionResult);

  @JsonKey(ignore: true)
  @override
  _$ProcessingSuccessCopyWith<_ProcessingSuccess> get copyWith =>
      __$ProcessingSuccessCopyWithImpl<_ProcessingSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult processingImage(),
    @required
        TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    @required TResult processingFailure(TextRecognitionFailure failure),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingSuccess(textRecognitionResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult processingImage(),
    TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    TResult processingFailure(TextRecognitionFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingSuccess != null) {
      return processingSuccess(textRecognitionResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult processingImage(_ProcessingImage value),
    @required TResult processingSuccess(_ProcessingSuccess value),
    @required TResult processingFailure(_ProcessingFailure value),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult processingImage(_ProcessingImage value),
    TResult processingSuccess(_ProcessingSuccess value),
    TResult processingFailure(_ProcessingFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingSuccess != null) {
      return processingSuccess(this);
    }
    return orElse();
  }
}

abstract class _ProcessingSuccess implements ImageProcesserState {
  const factory _ProcessingSuccess(
      TextRecognitionResult textRecognitionResult) = _$_ProcessingSuccess;

  TextRecognitionResult get textRecognitionResult;
  @JsonKey(ignore: true)
  _$ProcessingSuccessCopyWith<_ProcessingSuccess> get copyWith;
}

/// @nodoc
abstract class _$ProcessingFailureCopyWith<$Res> {
  factory _$ProcessingFailureCopyWith(
          _ProcessingFailure value, $Res Function(_ProcessingFailure) then) =
      __$ProcessingFailureCopyWithImpl<$Res>;
  $Res call({TextRecognitionFailure failure});

  $TextRecognitionFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ProcessingFailureCopyWithImpl<$Res>
    extends _$ImageProcesserStateCopyWithImpl<$Res>
    implements _$ProcessingFailureCopyWith<$Res> {
  __$ProcessingFailureCopyWithImpl(
      _ProcessingFailure _value, $Res Function(_ProcessingFailure) _then)
      : super(_value, (v) => _then(v as _ProcessingFailure));

  @override
  _ProcessingFailure get _value => super._value as _ProcessingFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_ProcessingFailure(
      failure == freezed ? _value.failure : failure as TextRecognitionFailure,
    ));
  }

  @override
  $TextRecognitionFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $TextRecognitionFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_ProcessingFailure implements _ProcessingFailure {
  const _$_ProcessingFailure(this.failure) : assert(failure != null);

  @override
  final TextRecognitionFailure failure;

  @override
  String toString() {
    return 'ImageProcesserState.processingFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessingFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$ProcessingFailureCopyWith<_ProcessingFailure> get copyWith =>
      __$ProcessingFailureCopyWithImpl<_ProcessingFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult processingImage(),
    @required
        TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    @required TResult processingFailure(TextRecognitionFailure failure),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult processingImage(),
    TResult processingSuccess(TextRecognitionResult textRecognitionResult),
    TResult processingFailure(TextRecognitionFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingFailure != null) {
      return processingFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult processingImage(_ProcessingImage value),
    @required TResult processingSuccess(_ProcessingSuccess value),
    @required TResult processingFailure(_ProcessingFailure value),
  }) {
    assert(initial != null);
    assert(processingImage != null);
    assert(processingSuccess != null);
    assert(processingFailure != null);
    return processingFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult processingImage(_ProcessingImage value),
    TResult processingSuccess(_ProcessingSuccess value),
    TResult processingFailure(_ProcessingFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (processingFailure != null) {
      return processingFailure(this);
    }
    return orElse();
  }
}

abstract class _ProcessingFailure implements ImageProcesserState {
  const factory _ProcessingFailure(TextRecognitionFailure failure) =
      _$_ProcessingFailure;

  TextRecognitionFailure get failure;
  @JsonKey(ignore: true)
  _$ProcessingFailureCopyWith<_ProcessingFailure> get copyWith;
}
