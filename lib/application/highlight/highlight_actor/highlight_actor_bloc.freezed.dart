// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightActorEventTearOff {
  const _$HighlightActorEventTearOff();

// ignore: unused_element
  _Deleted deleted(Highlight highlight) {
    return _Deleted(
      highlight,
    );
  }

// ignore: unused_element
  _ImageUploaded imageUploaded(ImagePrimitive image) {
    return _ImageUploaded(
      image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightActorEvent = _$HighlightActorEventTearOff();

/// @nodoc
mixin _$HighlightActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deleted(Highlight highlight),
    @required TResult imageUploaded(ImagePrimitive image),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deleted(Highlight highlight),
    TResult imageUploaded(ImagePrimitive image),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deleted(_Deleted value),
    @required TResult imageUploaded(_ImageUploaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deleted(_Deleted value),
    TResult imageUploaded(_ImageUploaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightActorEventCopyWith<$Res> {
  factory $HighlightActorEventCopyWith(
          HighlightActorEvent value, $Res Function(HighlightActorEvent) then) =
      _$HighlightActorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightActorEventCopyWithImpl<$Res>
    implements $HighlightActorEventCopyWith<$Res> {
  _$HighlightActorEventCopyWithImpl(this._value, this._then);

  final HighlightActorEvent _value;
  // ignore: unused_field
  final $Res Function(HighlightActorEvent) _then;
}

/// @nodoc
abstract class _$DeletedCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) then) =
      __$DeletedCopyWithImpl<$Res>;
  $Res call({Highlight highlight});

  $HighlightCopyWith<$Res> get highlight;
}

/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    extends _$HighlightActorEventCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(_Deleted _value, $Res Function(_Deleted) _then)
      : super(_value, (v) => _then(v as _Deleted));

  @override
  _Deleted get _value => super._value as _Deleted;

  @override
  $Res call({
    Object highlight = freezed,
  }) {
    return _then(_Deleted(
      highlight == freezed ? _value.highlight : highlight as Highlight,
    ));
  }

  @override
  $HighlightCopyWith<$Res> get highlight {
    if (_value.highlight == null) {
      return null;
    }
    return $HighlightCopyWith<$Res>(_value.highlight, (value) {
      return _then(_value.copyWith(highlight: value));
    });
  }
}

/// @nodoc
class _$_Deleted implements _Deleted {
  const _$_Deleted(this.highlight) : assert(highlight != null);

  @override
  final Highlight highlight;

  @override
  String toString() {
    return 'HighlightActorEvent.deleted(highlight: $highlight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Deleted &&
            (identical(other.highlight, highlight) ||
                const DeepCollectionEquality()
                    .equals(other.highlight, highlight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(highlight);

  @JsonKey(ignore: true)
  @override
  _$DeletedCopyWith<_Deleted> get copyWith =>
      __$DeletedCopyWithImpl<_Deleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deleted(Highlight highlight),
    @required TResult imageUploaded(ImagePrimitive image),
  }) {
    assert(deleted != null);
    assert(imageUploaded != null);
    return deleted(highlight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deleted(Highlight highlight),
    TResult imageUploaded(ImagePrimitive image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleted != null) {
      return deleted(highlight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deleted(_Deleted value),
    @required TResult imageUploaded(_ImageUploaded value),
  }) {
    assert(deleted != null);
    assert(imageUploaded != null);
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deleted(_Deleted value),
    TResult imageUploaded(_ImageUploaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements HighlightActorEvent {
  const factory _Deleted(Highlight highlight) = _$_Deleted;

  Highlight get highlight;
  @JsonKey(ignore: true)
  _$DeletedCopyWith<_Deleted> get copyWith;
}

/// @nodoc
abstract class _$ImageUploadedCopyWith<$Res> {
  factory _$ImageUploadedCopyWith(
          _ImageUploaded value, $Res Function(_ImageUploaded) then) =
      __$ImageUploadedCopyWithImpl<$Res>;
  $Res call({ImagePrimitive image});

  $ImagePrimitiveCopyWith<$Res> get image;
}

/// @nodoc
class __$ImageUploadedCopyWithImpl<$Res>
    extends _$HighlightActorEventCopyWithImpl<$Res>
    implements _$ImageUploadedCopyWith<$Res> {
  __$ImageUploadedCopyWithImpl(
      _ImageUploaded _value, $Res Function(_ImageUploaded) _then)
      : super(_value, (v) => _then(v as _ImageUploaded));

  @override
  _ImageUploaded get _value => super._value as _ImageUploaded;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_ImageUploaded(
      image == freezed ? _value.image : image as ImagePrimitive,
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
class _$_ImageUploaded implements _ImageUploaded {
  const _$_ImageUploaded(this.image) : assert(image != null);

  @override
  final ImagePrimitive image;

  @override
  String toString() {
    return 'HighlightActorEvent.imageUploaded(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageUploaded &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$ImageUploadedCopyWith<_ImageUploaded> get copyWith =>
      __$ImageUploadedCopyWithImpl<_ImageUploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult deleted(Highlight highlight),
    @required TResult imageUploaded(ImagePrimitive image),
  }) {
    assert(deleted != null);
    assert(imageUploaded != null);
    return imageUploaded(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult deleted(Highlight highlight),
    TResult imageUploaded(ImagePrimitive image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageUploaded != null) {
      return imageUploaded(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult deleted(_Deleted value),
    @required TResult imageUploaded(_ImageUploaded value),
  }) {
    assert(deleted != null);
    assert(imageUploaded != null);
    return imageUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult deleted(_Deleted value),
    TResult imageUploaded(_ImageUploaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageUploaded != null) {
      return imageUploaded(this);
    }
    return orElse();
  }
}

abstract class _ImageUploaded implements HighlightActorEvent {
  const factory _ImageUploaded(ImagePrimitive image) = _$_ImageUploaded;

  ImagePrimitive get image;
  @JsonKey(ignore: true)
  _$ImageUploadedCopyWith<_ImageUploaded> get copyWith;
}

/// @nodoc
class _$HighlightActorStateTearOff {
  const _$HighlightActorStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _ActionInProgress actionInProgress() {
    return const _ActionInProgress();
  }

// ignore: unused_element
  _DeleteFailure deleteFailure(HighlightFailure failure) {
    return _DeleteFailure(
      failure,
    );
  }

// ignore: unused_element
  _DeleteSuccess deleteSuccess() {
    return const _DeleteSuccess();
  }

// ignore: unused_element
  _UploadImageFailure uploadImageFailure(HighlightFailure failure) {
    return _UploadImageFailure(
      failure,
    );
  }

// ignore: unused_element
  _UploadImageSuccess uploadImageSuccess(Image image) {
    return _UploadImageSuccess(
      image,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightActorState = _$HighlightActorStateTearOff();

/// @nodoc
mixin _$HighlightActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightActorStateCopyWith<$Res> {
  factory $HighlightActorStateCopyWith(
          HighlightActorState value, $Res Function(HighlightActorState) then) =
      _$HighlightActorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightActorStateCopyWithImpl<$Res>
    implements $HighlightActorStateCopyWith<$Res> {
  _$HighlightActorStateCopyWithImpl(this._value, this._then);

  final HighlightActorState _value;
  // ignore: unused_field
  final $Res Function(HighlightActorState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
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
    return 'HighlightActorState.initial()';
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
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
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
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HighlightActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ActionInProgressCopyWith<$Res> {
  factory _$ActionInProgressCopyWith(
          _ActionInProgress value, $Res Function(_ActionInProgress) then) =
      __$ActionInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$ActionInProgressCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
    implements _$ActionInProgressCopyWith<$Res> {
  __$ActionInProgressCopyWithImpl(
      _ActionInProgress _value, $Res Function(_ActionInProgress) _then)
      : super(_value, (v) => _then(v as _ActionInProgress));

  @override
  _ActionInProgress get _value => super._value as _ActionInProgress;
}

/// @nodoc
class _$_ActionInProgress implements _ActionInProgress {
  const _$_ActionInProgress();

  @override
  String toString() {
    return 'HighlightActorState.actionInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ActionInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class _ActionInProgress implements HighlightActorState {
  const factory _ActionInProgress() = _$_ActionInProgress;
}

/// @nodoc
abstract class _$DeleteFailureCopyWith<$Res> {
  factory _$DeleteFailureCopyWith(
          _DeleteFailure value, $Res Function(_DeleteFailure) then) =
      __$DeleteFailureCopyWithImpl<$Res>;
  $Res call({HighlightFailure failure});

  $HighlightFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$DeleteFailureCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
    implements _$DeleteFailureCopyWith<$Res> {
  __$DeleteFailureCopyWithImpl(
      _DeleteFailure _value, $Res Function(_DeleteFailure) _then)
      : super(_value, (v) => _then(v as _DeleteFailure));

  @override
  _DeleteFailure get _value => super._value as _DeleteFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_DeleteFailure(
      failure == freezed ? _value.failure : failure as HighlightFailure,
    ));
  }

  @override
  $HighlightFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $HighlightFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_DeleteFailure implements _DeleteFailure {
  const _$_DeleteFailure(this.failure) : assert(failure != null);

  @override
  final HighlightFailure failure;

  @override
  String toString() {
    return 'HighlightActorState.deleteFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$DeleteFailureCopyWith<_DeleteFailure> get copyWith =>
      __$DeleteFailureCopyWithImpl<_DeleteFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return deleteFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return deleteFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteFailure implements HighlightActorState {
  const factory _DeleteFailure(HighlightFailure failure) = _$_DeleteFailure;

  HighlightFailure get failure;
  @JsonKey(ignore: true)
  _$DeleteFailureCopyWith<_DeleteFailure> get copyWith;
}

/// @nodoc
abstract class _$DeleteSuccessCopyWith<$Res> {
  factory _$DeleteSuccessCopyWith(
          _DeleteSuccess value, $Res Function(_DeleteSuccess) then) =
      __$DeleteSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeleteSuccessCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
    implements _$DeleteSuccessCopyWith<$Res> {
  __$DeleteSuccessCopyWithImpl(
      _DeleteSuccess _value, $Res Function(_DeleteSuccess) _then)
      : super(_value, (v) => _then(v as _DeleteSuccess));

  @override
  _DeleteSuccess get _value => super._value as _DeleteSuccess;
}

/// @nodoc
class _$_DeleteSuccess implements _DeleteSuccess {
  const _$_DeleteSuccess();

  @override
  String toString() {
    return 'HighlightActorState.deleteSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _DeleteSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return deleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteSuccess implements HighlightActorState {
  const factory _DeleteSuccess() = _$_DeleteSuccess;
}

/// @nodoc
abstract class _$UploadImageFailureCopyWith<$Res> {
  factory _$UploadImageFailureCopyWith(
          _UploadImageFailure value, $Res Function(_UploadImageFailure) then) =
      __$UploadImageFailureCopyWithImpl<$Res>;
  $Res call({HighlightFailure failure});

  $HighlightFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$UploadImageFailureCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
    implements _$UploadImageFailureCopyWith<$Res> {
  __$UploadImageFailureCopyWithImpl(
      _UploadImageFailure _value, $Res Function(_UploadImageFailure) _then)
      : super(_value, (v) => _then(v as _UploadImageFailure));

  @override
  _UploadImageFailure get _value => super._value as _UploadImageFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_UploadImageFailure(
      failure == freezed ? _value.failure : failure as HighlightFailure,
    ));
  }

  @override
  $HighlightFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $HighlightFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$_UploadImageFailure implements _UploadImageFailure {
  const _$_UploadImageFailure(this.failure) : assert(failure != null);

  @override
  final HighlightFailure failure;

  @override
  String toString() {
    return 'HighlightActorState.uploadImageFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadImageFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$UploadImageFailureCopyWith<_UploadImageFailure> get copyWith =>
      __$UploadImageFailureCopyWithImpl<_UploadImageFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return uploadImageFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (uploadImageFailure != null) {
      return uploadImageFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return uploadImageFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (uploadImageFailure != null) {
      return uploadImageFailure(this);
    }
    return orElse();
  }
}

abstract class _UploadImageFailure implements HighlightActorState {
  const factory _UploadImageFailure(HighlightFailure failure) =
      _$_UploadImageFailure;

  HighlightFailure get failure;
  @JsonKey(ignore: true)
  _$UploadImageFailureCopyWith<_UploadImageFailure> get copyWith;
}

/// @nodoc
abstract class _$UploadImageSuccessCopyWith<$Res> {
  factory _$UploadImageSuccessCopyWith(
          _UploadImageSuccess value, $Res Function(_UploadImageSuccess) then) =
      __$UploadImageSuccessCopyWithImpl<$Res>;
  $Res call({Image image});

  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class __$UploadImageSuccessCopyWithImpl<$Res>
    extends _$HighlightActorStateCopyWithImpl<$Res>
    implements _$UploadImageSuccessCopyWith<$Res> {
  __$UploadImageSuccessCopyWithImpl(
      _UploadImageSuccess _value, $Res Function(_UploadImageSuccess) _then)
      : super(_value, (v) => _then(v as _UploadImageSuccess));

  @override
  _UploadImageSuccess get _value => super._value as _UploadImageSuccess;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_UploadImageSuccess(
      image == freezed ? _value.image : image as Image,
    ));
  }

  @override
  $ImageCopyWith<$Res> get image {
    if (_value.image == null) {
      return null;
    }
    return $ImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
class _$_UploadImageSuccess implements _UploadImageSuccess {
  const _$_UploadImageSuccess(this.image) : assert(image != null);

  @override
  final Image image;

  @override
  String toString() {
    return 'HighlightActorState.uploadImageSuccess(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadImageSuccess &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$UploadImageSuccessCopyWith<_UploadImageSuccess> get copyWith =>
      __$UploadImageSuccessCopyWithImpl<_UploadImageSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult actionInProgress(),
    @required TResult deleteFailure(HighlightFailure failure),
    @required TResult deleteSuccess(),
    @required TResult uploadImageFailure(HighlightFailure failure),
    @required TResult uploadImageSuccess(Image image),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return uploadImageSuccess(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult actionInProgress(),
    TResult deleteFailure(HighlightFailure failure),
    TResult deleteSuccess(),
    TResult uploadImageFailure(HighlightFailure failure),
    TResult uploadImageSuccess(Image image),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult actionInProgress(_ActionInProgress value),
    @required TResult deleteFailure(_DeleteFailure value),
    @required TResult deleteSuccess(_DeleteSuccess value),
    @required TResult uploadImageFailure(_UploadImageFailure value),
    @required TResult uploadImageSuccess(_UploadImageSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(uploadImageFailure != null);
    assert(uploadImageSuccess != null);
    return uploadImageSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult actionInProgress(_ActionInProgress value),
    TResult deleteFailure(_DeleteFailure value),
    TResult deleteSuccess(_DeleteSuccess value),
    TResult uploadImageFailure(_UploadImageFailure value),
    TResult uploadImageSuccess(_UploadImageSuccess value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(this);
    }
    return orElse();
  }
}

abstract class _UploadImageSuccess implements HighlightActorState {
  const factory _UploadImageSuccess(Image image) = _$_UploadImageSuccess;

  Image get image;
  @JsonKey(ignore: true)
  _$UploadImageSuccessCopyWith<_UploadImageSuccess> get copyWith;
}
