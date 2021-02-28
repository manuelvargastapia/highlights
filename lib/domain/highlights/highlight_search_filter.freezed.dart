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
  _HighlightSearchFilter call({@required bool showOnlyIfHasImage}) {
    return _HighlightSearchFilter(
      showOnlyIfHasImage: showOnlyIfHasImage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightSearchFilter = _$HighlightSearchFilterTearOff();

/// @nodoc
mixin _$HighlightSearchFilter {
  bool get showOnlyIfHasImage;

  @JsonKey(ignore: true)
  $HighlightSearchFilterCopyWith<HighlightSearchFilter> get copyWith;
}

/// @nodoc
abstract class $HighlightSearchFilterCopyWith<$Res> {
  factory $HighlightSearchFilterCopyWith(HighlightSearchFilter value,
          $Res Function(HighlightSearchFilter) then) =
      _$HighlightSearchFilterCopyWithImpl<$Res>;
  $Res call({bool showOnlyIfHasImage});
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
    Object showOnlyIfHasImage = freezed,
  }) {
    return _then(_value.copyWith(
      showOnlyIfHasImage: showOnlyIfHasImage == freezed
          ? _value.showOnlyIfHasImage
          : showOnlyIfHasImage as bool,
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
  $Res call({bool showOnlyIfHasImage});
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
    Object showOnlyIfHasImage = freezed,
  }) {
    return _then(_HighlightSearchFilter(
      showOnlyIfHasImage: showOnlyIfHasImage == freezed
          ? _value.showOnlyIfHasImage
          : showOnlyIfHasImage as bool,
    ));
  }
}

/// @nodoc
class _$_HighlightSearchFilter implements _HighlightSearchFilter {
  const _$_HighlightSearchFilter({@required this.showOnlyIfHasImage})
      : assert(showOnlyIfHasImage != null);

  @override
  final bool showOnlyIfHasImage;

  @override
  String toString() {
    return 'HighlightSearchFilter(showOnlyIfHasImage: $showOnlyIfHasImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlightSearchFilter &&
            (identical(other.showOnlyIfHasImage, showOnlyIfHasImage) ||
                const DeepCollectionEquality()
                    .equals(other.showOnlyIfHasImage, showOnlyIfHasImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showOnlyIfHasImage);

  @JsonKey(ignore: true)
  @override
  _$HighlightSearchFilterCopyWith<_HighlightSearchFilter> get copyWith =>
      __$HighlightSearchFilterCopyWithImpl<_HighlightSearchFilter>(
          this, _$identity);
}

abstract class _HighlightSearchFilter implements HighlightSearchFilter {
  const factory _HighlightSearchFilter({@required bool showOnlyIfHasImage}) =
      _$_HighlightSearchFilter;

  @override
  bool get showOnlyIfHasImage;
  @override
  @JsonKey(ignore: true)
  _$HighlightSearchFilterCopyWith<_HighlightSearchFilter> get copyWith;
}
