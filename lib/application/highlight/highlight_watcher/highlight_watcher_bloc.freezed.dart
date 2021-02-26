// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightWatcherEventTearOff {
  const _$HighlightWatcherEventTearOff();

// ignore: unused_element
  _WatchAllStarted watchAllStarted() {
    return const _WatchAllStarted();
  }

// ignore: unused_element
  _WatchFilteredStarted watchFilteredStarted(HighlightSearchFilter filter) {
    return _WatchFilteredStarted(
      filter,
    );
  }

// ignore: unused_element
  _HighlighReceived highlighReceived(
      Either<HighlightFailure, KtList<Highlight>> failureOrHighlights) {
    return _HighlighReceived(
      failureOrHighlights,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightWatcherEvent = _$HighlightWatcherEventTearOff();

/// @nodoc
mixin _$HighlightWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchFilteredStarted(HighlightSearchFilter filter),
    @required
        TResult highlighReceived(
            Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchFilteredStarted(HighlightSearchFilter filter),
    TResult highlighReceived(
        Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchFilteredStarted(_WatchFilteredStarted value),
    @required TResult highlighReceived(_HighlighReceived value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchFilteredStarted(_WatchFilteredStarted value),
    TResult highlighReceived(_HighlighReceived value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightWatcherEventCopyWith<$Res> {
  factory $HighlightWatcherEventCopyWith(HighlightWatcherEvent value,
          $Res Function(HighlightWatcherEvent) then) =
      _$HighlightWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightWatcherEventCopyWithImpl<$Res>
    implements $HighlightWatcherEventCopyWith<$Res> {
  _$HighlightWatcherEventCopyWithImpl(this._value, this._then);

  final HighlightWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(HighlightWatcherEvent) _then;
}

/// @nodoc
abstract class _$WatchAllStartedCopyWith<$Res> {
  factory _$WatchAllStartedCopyWith(
          _WatchAllStarted value, $Res Function(_WatchAllStarted) then) =
      __$WatchAllStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatchAllStartedCopyWithImpl<$Res>
    extends _$HighlightWatcherEventCopyWithImpl<$Res>
    implements _$WatchAllStartedCopyWith<$Res> {
  __$WatchAllStartedCopyWithImpl(
      _WatchAllStarted _value, $Res Function(_WatchAllStarted) _then)
      : super(_value, (v) => _then(v as _WatchAllStarted));

  @override
  _WatchAllStarted get _value => super._value as _WatchAllStarted;
}

/// @nodoc
class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted();

  @override
  String toString() {
    return 'HighlightWatcherEvent.watchAllStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchAllStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchFilteredStarted(HighlightSearchFilter filter),
    @required
        TResult highlighReceived(
            Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return watchAllStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchFilteredStarted(HighlightSearchFilter filter),
    TResult highlighReceived(
        Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchFilteredStarted(_WatchFilteredStarted value),
    @required TResult highlighReceived(_HighlighReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchFilteredStarted(_WatchFilteredStarted value),
    TResult highlighReceived(_HighlighReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements HighlightWatcherEvent {
  const factory _WatchAllStarted() = _$_WatchAllStarted;
}

/// @nodoc
abstract class _$WatchFilteredStartedCopyWith<$Res> {
  factory _$WatchFilteredStartedCopyWith(_WatchFilteredStarted value,
          $Res Function(_WatchFilteredStarted) then) =
      __$WatchFilteredStartedCopyWithImpl<$Res>;
  $Res call({HighlightSearchFilter filter});

  $HighlightSearchFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$WatchFilteredStartedCopyWithImpl<$Res>
    extends _$HighlightWatcherEventCopyWithImpl<$Res>
    implements _$WatchFilteredStartedCopyWith<$Res> {
  __$WatchFilteredStartedCopyWithImpl(
      _WatchFilteredStarted _value, $Res Function(_WatchFilteredStarted) _then)
      : super(_value, (v) => _then(v as _WatchFilteredStarted));

  @override
  _WatchFilteredStarted get _value => super._value as _WatchFilteredStarted;

  @override
  $Res call({
    Object filter = freezed,
  }) {
    return _then(_WatchFilteredStarted(
      filter == freezed ? _value.filter : filter as HighlightSearchFilter,
    ));
  }

  @override
  $HighlightSearchFilterCopyWith<$Res> get filter {
    if (_value.filter == null) {
      return null;
    }
    return $HighlightSearchFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc
class _$_WatchFilteredStarted implements _WatchFilteredStarted {
  const _$_WatchFilteredStarted(this.filter) : assert(filter != null);

  @override
  final HighlightSearchFilter filter;

  @override
  String toString() {
    return 'HighlightWatcherEvent.watchFilteredStarted(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WatchFilteredStarted &&
            (identical(other.filter, filter) ||
                const DeepCollectionEquality().equals(other.filter, filter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filter);

  @JsonKey(ignore: true)
  @override
  _$WatchFilteredStartedCopyWith<_WatchFilteredStarted> get copyWith =>
      __$WatchFilteredStartedCopyWithImpl<_WatchFilteredStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchFilteredStarted(HighlightSearchFilter filter),
    @required
        TResult highlighReceived(
            Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return watchFilteredStarted(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchFilteredStarted(HighlightSearchFilter filter),
    TResult highlighReceived(
        Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchFilteredStarted != null) {
      return watchFilteredStarted(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchFilteredStarted(_WatchFilteredStarted value),
    @required TResult highlighReceived(_HighlighReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return watchFilteredStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchFilteredStarted(_WatchFilteredStarted value),
    TResult highlighReceived(_HighlighReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (watchFilteredStarted != null) {
      return watchFilteredStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchFilteredStarted implements HighlightWatcherEvent {
  const factory _WatchFilteredStarted(HighlightSearchFilter filter) =
      _$_WatchFilteredStarted;

  HighlightSearchFilter get filter;
  @JsonKey(ignore: true)
  _$WatchFilteredStartedCopyWith<_WatchFilteredStarted> get copyWith;
}

/// @nodoc
abstract class _$HighlighReceivedCopyWith<$Res> {
  factory _$HighlighReceivedCopyWith(
          _HighlighReceived value, $Res Function(_HighlighReceived) then) =
      __$HighlighReceivedCopyWithImpl<$Res>;
  $Res call({Either<HighlightFailure, KtList<Highlight>> failureOrHighlights});
}

/// @nodoc
class __$HighlighReceivedCopyWithImpl<$Res>
    extends _$HighlightWatcherEventCopyWithImpl<$Res>
    implements _$HighlighReceivedCopyWith<$Res> {
  __$HighlighReceivedCopyWithImpl(
      _HighlighReceived _value, $Res Function(_HighlighReceived) _then)
      : super(_value, (v) => _then(v as _HighlighReceived));

  @override
  _HighlighReceived get _value => super._value as _HighlighReceived;

  @override
  $Res call({
    Object failureOrHighlights = freezed,
  }) {
    return _then(_HighlighReceived(
      failureOrHighlights == freezed
          ? _value.failureOrHighlights
          : failureOrHighlights as Either<HighlightFailure, KtList<Highlight>>,
    ));
  }
}

/// @nodoc
class _$_HighlighReceived implements _HighlighReceived {
  const _$_HighlighReceived(this.failureOrHighlights)
      : assert(failureOrHighlights != null);

  @override
  final Either<HighlightFailure, KtList<Highlight>> failureOrHighlights;

  @override
  String toString() {
    return 'HighlightWatcherEvent.highlighReceived(failureOrHighlights: $failureOrHighlights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlighReceived &&
            (identical(other.failureOrHighlights, failureOrHighlights) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrHighlights, failureOrHighlights)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrHighlights);

  @JsonKey(ignore: true)
  @override
  _$HighlighReceivedCopyWith<_HighlighReceived> get copyWith =>
      __$HighlighReceivedCopyWithImpl<_HighlighReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult watchAllStarted(),
    @required TResult watchFilteredStarted(HighlightSearchFilter filter),
    @required
        TResult highlighReceived(
            Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return highlighReceived(failureOrHighlights);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult watchAllStarted(),
    TResult watchFilteredStarted(HighlightSearchFilter filter),
    TResult highlighReceived(
        Either<HighlightFailure, KtList<Highlight>> failureOrHighlights),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (highlighReceived != null) {
      return highlighReceived(failureOrHighlights);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult watchAllStarted(_WatchAllStarted value),
    @required TResult watchFilteredStarted(_WatchFilteredStarted value),
    @required TResult highlighReceived(_HighlighReceived value),
  }) {
    assert(watchAllStarted != null);
    assert(watchFilteredStarted != null);
    assert(highlighReceived != null);
    return highlighReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult watchAllStarted(_WatchAllStarted value),
    TResult watchFilteredStarted(_WatchFilteredStarted value),
    TResult highlighReceived(_HighlighReceived value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (highlighReceived != null) {
      return highlighReceived(this);
    }
    return orElse();
  }
}

abstract class _HighlighReceived implements HighlightWatcherEvent {
  const factory _HighlighReceived(
          Either<HighlightFailure, KtList<Highlight>> failureOrHighlights) =
      _$_HighlighReceived;

  Either<HighlightFailure, KtList<Highlight>> get failureOrHighlights;
  @JsonKey(ignore: true)
  _$HighlighReceivedCopyWith<_HighlighReceived> get copyWith;
}

/// @nodoc
class _$HighlightWatcherStateTearOff {
  const _$HighlightWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

// ignore: unused_element
  _LoadSuccess loadSuccess(KtList<Highlight> highlights) {
    return _LoadSuccess(
      highlights,
    );
  }

// ignore: unused_element
  _LoadFailure loadFailure(HighlightFailure failure) {
    return _LoadFailure(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightWatcherState = _$HighlightWatcherStateTearOff();

/// @nodoc
mixin _$HighlightWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Highlight> highlights),
    @required TResult loadFailure(HighlightFailure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Highlight> highlights),
    TResult loadFailure(HighlightFailure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightWatcherStateCopyWith<$Res> {
  factory $HighlightWatcherStateCopyWith(HighlightWatcherState value,
          $Res Function(HighlightWatcherState) then) =
      _$HighlightWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightWatcherStateCopyWithImpl<$Res>
    implements $HighlightWatcherStateCopyWith<$Res> {
  _$HighlightWatcherStateCopyWithImpl(this._value, this._then);

  final HighlightWatcherState _value;
  // ignore: unused_field
  final $Res Function(HighlightWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$HighlightWatcherStateCopyWithImpl<$Res>
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
    return 'HighlightWatcherState.initial()';
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
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Highlight> highlights),
    @required TResult loadFailure(HighlightFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Highlight> highlights),
    TResult loadFailure(HighlightFailure failure),
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
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HighlightWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$HighlightWatcherStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc
class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'HighlightWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Highlight> highlights),
    @required TResult loadFailure(HighlightFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Highlight> highlights),
    TResult loadFailure(HighlightFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements HighlightWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({KtList<Highlight> highlights});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$HighlightWatcherStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object highlights = freezed,
  }) {
    return _then(_LoadSuccess(
      highlights == freezed
          ? _value.highlights
          : highlights as KtList<Highlight>,
    ));
  }
}

/// @nodoc
class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.highlights) : assert(highlights != null);

  @override
  final KtList<Highlight> highlights;

  @override
  String toString() {
    return 'HighlightWatcherState.loadSuccess(highlights: $highlights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.highlights, highlights) ||
                const DeepCollectionEquality()
                    .equals(other.highlights, highlights)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(highlights);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Highlight> highlights),
    @required TResult loadFailure(HighlightFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(highlights);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Highlight> highlights),
    TResult loadFailure(HighlightFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(highlights);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements HighlightWatcherState {
  const factory _LoadSuccess(KtList<Highlight> highlights) = _$_LoadSuccess;

  KtList<Highlight> get highlights;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({HighlightFailure failure});

  $HighlightFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$HighlightWatcherStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(_LoadFailure(
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
class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.failure) : assert(failure != null);

  @override
  final HighlightFailure failure;

  @override
  String toString() {
    return 'HighlightWatcherState.loadFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loadInProgress(),
    @required TResult loadSuccess(KtList<Highlight> highlights),
    @required TResult loadFailure(HighlightFailure failure),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loadInProgress(),
    TResult loadSuccess(KtList<Highlight> highlights),
    TResult loadFailure(HighlightFailure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult loadInProgress(_LoadInProgress value),
    @required TResult loadSuccess(_LoadSuccess value),
    @required TResult loadFailure(_LoadFailure value),
  }) {
    assert(initial != null);
    assert(loadInProgress != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult loadInProgress(_LoadInProgress value),
    TResult loadSuccess(_LoadSuccess value),
    TResult loadFailure(_LoadFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements HighlightWatcherState {
  const factory _LoadFailure(HighlightFailure failure) = _$_LoadFailure;

  HighlightFailure get failure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith;
}
