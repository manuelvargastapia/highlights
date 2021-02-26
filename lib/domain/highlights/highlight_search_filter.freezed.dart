// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightSearchFilterTearOff {
  const _$HighlightSearchFilterTearOff();

// ignore: unused_element
  _HighlightSearchFilter call({@required bool hasImage}) {
    return _HighlightSearchFilter(
      hasImage: hasImage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightSearchFilter = _$HighlightSearchFilterTearOff();

/// @nodoc
mixin _$HighlightSearchFilter {
  bool get hasImage;

  @JsonKey(ignore: true)
  $HighlightSearchFilterCopyWith<HighlightSearchFilter> get copyWith;
}

/// @nodoc
abstract class $HighlightSearchFilterCopyWith<$Res> {
  factory $HighlightSearchFilterCopyWith(HighlightSearchFilter value,
          $Res Function(HighlightSearchFilter) then) =
      _$HighlightSearchFilterCopyWithImpl<$Res>;
  $Res call({bool hasImage});
}

/// @nodoc
class _$HighlightSearchFilterCopyWithImpl<$Res>
    implements $HighlightSearchFilterCopyWith<$Res> {
  _$HighlightSearchFilterCopyWithImpl(this._value, this._then);

  final HighlightSearchFilter _value;
  // ignore: unused_field
  final $Res Function(HighlightSearchFilter) _then;

  @override
  $Res call({
    Object hasImage = freezed,
  }) {
    return _then(_value.copyWith(
      hasImage: hasImage == freezed ? _value.hasImage : hasImage as bool,
    ));
  }
}

/// @nodoc
abstract class _$HighlightSearchFilterCopyWith<$Res>
    implements $HighlightSearchFilterCopyWith<$Res> {
  factory _$HighlightSearchFilterCopyWith(_HighlightSearchFilter value,
          $Res Function(_HighlightSearchFilter) then) =
      __$HighlightSearchFilterCopyWithImpl<$Res>;
  @override
  $Res call({bool hasImage});
}

/// @nodoc
class __$HighlightSearchFilterCopyWithImpl<$Res>
    extends _$HighlightSearchFilterCopyWithImpl<$Res>
    implements _$HighlightSearchFilterCopyWith<$Res> {
  __$HighlightSearchFilterCopyWithImpl(_HighlightSearchFilter _value,
      $Res Function(_HighlightSearchFilter) _then)
      : super(_value, (v) => _then(v as _HighlightSearchFilter));

  @override
  _HighlightSearchFilter get _value => super._value as _HighlightSearchFilter;

  @override
  $Res call({
    Object hasImage = freezed,
  }) {
    return _then(_HighlightSearchFilter(
      hasImage: hasImage == freezed ? _value.hasImage : hasImage as bool,
    ));
  }
}

/// @nodoc
class _$_HighlightSearchFilter implements _HighlightSearchFilter {
  const _$_HighlightSearchFilter({@required this.hasImage})
      : assert(hasImage != null);

  @override
  final bool hasImage;

  @override
  String toString() {
    return 'HighlightSearchFilter(hasImage: $hasImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlightSearchFilter &&
            (identical(other.hasImage, hasImage) ||
                const DeepCollectionEquality()
                    .equals(other.hasImage, hasImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(hasImage);

  @JsonKey(ignore: true)
  @override
  _$HighlightSearchFilterCopyWith<_HighlightSearchFilter> get copyWith =>
      __$HighlightSearchFilterCopyWithImpl<_HighlightSearchFilter>(
          this, _$identity);
}

abstract class _HighlightSearchFilter implements HighlightSearchFilter {
  const factory _HighlightSearchFilter({@required bool hasImage}) =
      _$_HighlightSearchFilter;

  @override
  bool get hasImage;
  @override
  @JsonKey(ignore: true)
  _$HighlightSearchFilterCopyWith<_HighlightSearchFilter> get copyWith;
}
