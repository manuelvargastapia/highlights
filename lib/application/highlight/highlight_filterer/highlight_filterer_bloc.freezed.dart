// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_filterer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightFiltererEventTearOff {
  const _$HighlightFiltererEventTearOff();

// ignore: unused_element
  _ShowOnlyIfHasImageToggled showOnlyIfHasImageToggled() {
    return const _ShowOnlyIfHasImageToggled();
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightFiltererEvent = _$HighlightFiltererEventTearOff();

/// @nodoc
mixin _$HighlightFiltererEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult showOnlyIfHasImageToggled(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult showOnlyIfHasImageToggled(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult showOnlyIfHasImageToggled(_ShowOnlyIfHasImageToggled value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult showOnlyIfHasImageToggled(_ShowOnlyIfHasImageToggled value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightFiltererEventCopyWith<$Res> {
  factory $HighlightFiltererEventCopyWith(HighlightFiltererEvent value,
          $Res Function(HighlightFiltererEvent) then) =
      _$HighlightFiltererEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightFiltererEventCopyWithImpl<$Res>
    implements $HighlightFiltererEventCopyWith<$Res> {
  _$HighlightFiltererEventCopyWithImpl(this._value, this._then);

  final HighlightFiltererEvent _value;
  // ignore: unused_field
  final $Res Function(HighlightFiltererEvent) _then;
}

/// @nodoc
abstract class _$ShowOnlyIfHasImageToggledCopyWith<$Res> {
  factory _$ShowOnlyIfHasImageToggledCopyWith(_ShowOnlyIfHasImageToggled value,
          $Res Function(_ShowOnlyIfHasImageToggled) then) =
      __$ShowOnlyIfHasImageToggledCopyWithImpl<$Res>;
}

/// @nodoc
class __$ShowOnlyIfHasImageToggledCopyWithImpl<$Res>
    extends _$HighlightFiltererEventCopyWithImpl<$Res>
    implements _$ShowOnlyIfHasImageToggledCopyWith<$Res> {
  __$ShowOnlyIfHasImageToggledCopyWithImpl(_ShowOnlyIfHasImageToggled _value,
      $Res Function(_ShowOnlyIfHasImageToggled) _then)
      : super(_value, (v) => _then(v as _ShowOnlyIfHasImageToggled));

  @override
  _ShowOnlyIfHasImageToggled get _value =>
      super._value as _ShowOnlyIfHasImageToggled;
}

/// @nodoc
class _$_ShowOnlyIfHasImageToggled implements _ShowOnlyIfHasImageToggled {
  const _$_ShowOnlyIfHasImageToggled();

  @override
  String toString() {
    return 'HighlightFiltererEvent.showOnlyIfHasImageToggled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShowOnlyIfHasImageToggled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult showOnlyIfHasImageToggled(),
  }) {
    assert(showOnlyIfHasImageToggled != null);
    return showOnlyIfHasImageToggled();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult showOnlyIfHasImageToggled(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (showOnlyIfHasImageToggled != null) {
      return showOnlyIfHasImageToggled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult showOnlyIfHasImageToggled(_ShowOnlyIfHasImageToggled value),
  }) {
    assert(showOnlyIfHasImageToggled != null);
    return showOnlyIfHasImageToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult showOnlyIfHasImageToggled(_ShowOnlyIfHasImageToggled value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (showOnlyIfHasImageToggled != null) {
      return showOnlyIfHasImageToggled(this);
    }
    return orElse();
  }
}

abstract class _ShowOnlyIfHasImageToggled implements HighlightFiltererEvent {
  const factory _ShowOnlyIfHasImageToggled() = _$_ShowOnlyIfHasImageToggled;
}

/// @nodoc
class _$HighlightFiltererStateTearOff {
  const _$HighlightFiltererStateTearOff();

// ignore: unused_element
  _HighlightFiltererState call({@required HighlightSearchFilter filters}) {
    return _HighlightFiltererState(
      filters: filters,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightFiltererState = _$HighlightFiltererStateTearOff();

/// @nodoc
mixin _$HighlightFiltererState {
  HighlightSearchFilter get filters;

  @JsonKey(ignore: true)
  $HighlightFiltererStateCopyWith<HighlightFiltererState> get copyWith;
}

/// @nodoc
abstract class $HighlightFiltererStateCopyWith<$Res> {
  factory $HighlightFiltererStateCopyWith(HighlightFiltererState value,
          $Res Function(HighlightFiltererState) then) =
      _$HighlightFiltererStateCopyWithImpl<$Res>;
  $Res call({HighlightSearchFilter filters});

  $HighlightSearchFilterCopyWith<$Res> get filters;
}

/// @nodoc
class _$HighlightFiltererStateCopyWithImpl<$Res>
    implements $HighlightFiltererStateCopyWith<$Res> {
  _$HighlightFiltererStateCopyWithImpl(this._value, this._then);

  final HighlightFiltererState _value;
  // ignore: unused_field
  final $Res Function(HighlightFiltererState) _then;

  @override
  $Res call({
    Object filters = freezed,
  }) {
    return _then(_value.copyWith(
      filters: filters == freezed
          ? _value.filters
          : filters as HighlightSearchFilter,
    ));
  }

  @override
  $HighlightSearchFilterCopyWith<$Res> get filters {
    if (_value.filters == null) {
      return null;
    }
    return $HighlightSearchFilterCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc
abstract class _$HighlightFiltererStateCopyWith<$Res>
    implements $HighlightFiltererStateCopyWith<$Res> {
  factory _$HighlightFiltererStateCopyWith(_HighlightFiltererState value,
          $Res Function(_HighlightFiltererState) then) =
      __$HighlightFiltererStateCopyWithImpl<$Res>;
  @override
  $Res call({HighlightSearchFilter filters});

  @override
  $HighlightSearchFilterCopyWith<$Res> get filters;
}

/// @nodoc
class __$HighlightFiltererStateCopyWithImpl<$Res>
    extends _$HighlightFiltererStateCopyWithImpl<$Res>
    implements _$HighlightFiltererStateCopyWith<$Res> {
  __$HighlightFiltererStateCopyWithImpl(_HighlightFiltererState _value,
      $Res Function(_HighlightFiltererState) _then)
      : super(_value, (v) => _then(v as _HighlightFiltererState));

  @override
  _HighlightFiltererState get _value => super._value as _HighlightFiltererState;

  @override
  $Res call({
    Object filters = freezed,
  }) {
    return _then(_HighlightFiltererState(
      filters: filters == freezed
          ? _value.filters
          : filters as HighlightSearchFilter,
    ));
  }
}

/// @nodoc
class _$_HighlightFiltererState implements _HighlightFiltererState {
  const _$_HighlightFiltererState({@required this.filters})
      : assert(filters != null);

  @override
  final HighlightSearchFilter filters;

  @override
  String toString() {
    return 'HighlightFiltererState(filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlightFiltererState &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filters);

  @JsonKey(ignore: true)
  @override
  _$HighlightFiltererStateCopyWith<_HighlightFiltererState> get copyWith =>
      __$HighlightFiltererStateCopyWithImpl<_HighlightFiltererState>(
          this, _$identity);
}

abstract class _HighlightFiltererState implements HighlightFiltererState {
  const factory _HighlightFiltererState(
      {@required HighlightSearchFilter filters}) = _$_HighlightFiltererState;

  @override
  HighlightSearchFilter get filters;
  @override
  @JsonKey(ignore: true)
  _$HighlightFiltererStateCopyWith<_HighlightFiltererState> get copyWith;
}
