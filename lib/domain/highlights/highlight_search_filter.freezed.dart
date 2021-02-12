// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlighSearchFilterTearOff {
  const _$HighlighSearchFilterTearOff();

// ignore: unused_element
  _ByBookTitle byBookTitle({@required BookTitleFilter bookTitle}) {
    return _ByBookTitle(
      bookTitle: bookTitle,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlighSearchFilter = _$HighlighSearchFilterTearOff();

/// @nodoc
mixin _$HighlighSearchFilter {
  BookTitleFilter get bookTitle;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult byBookTitle(BookTitleFilter bookTitle),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult byBookTitle(BookTitleFilter bookTitle),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult byBookTitle(_ByBookTitle value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult byBookTitle(_ByBookTitle value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $HighlighSearchFilterCopyWith<HighlighSearchFilter> get copyWith;
}

/// @nodoc
abstract class $HighlighSearchFilterCopyWith<$Res> {
  factory $HighlighSearchFilterCopyWith(HighlighSearchFilter value,
          $Res Function(HighlighSearchFilter) then) =
      _$HighlighSearchFilterCopyWithImpl<$Res>;
  $Res call({BookTitleFilter bookTitle});
}

/// @nodoc
class _$HighlighSearchFilterCopyWithImpl<$Res>
    implements $HighlighSearchFilterCopyWith<$Res> {
  _$HighlighSearchFilterCopyWithImpl(this._value, this._then);

  final HighlighSearchFilter _value;
  // ignore: unused_field
  final $Res Function(HighlighSearchFilter) _then;

  @override
  $Res call({
    Object bookTitle = freezed,
  }) {
    return _then(_value.copyWith(
      bookTitle: bookTitle == freezed
          ? _value.bookTitle
          : bookTitle as BookTitleFilter,
    ));
  }
}

/// @nodoc
abstract class _$ByBookTitleCopyWith<$Res>
    implements $HighlighSearchFilterCopyWith<$Res> {
  factory _$ByBookTitleCopyWith(
          _ByBookTitle value, $Res Function(_ByBookTitle) then) =
      __$ByBookTitleCopyWithImpl<$Res>;
  @override
  $Res call({BookTitleFilter bookTitle});
}

/// @nodoc
class __$ByBookTitleCopyWithImpl<$Res>
    extends _$HighlighSearchFilterCopyWithImpl<$Res>
    implements _$ByBookTitleCopyWith<$Res> {
  __$ByBookTitleCopyWithImpl(
      _ByBookTitle _value, $Res Function(_ByBookTitle) _then)
      : super(_value, (v) => _then(v as _ByBookTitle));

  @override
  _ByBookTitle get _value => super._value as _ByBookTitle;

  @override
  $Res call({
    Object bookTitle = freezed,
  }) {
    return _then(_ByBookTitle(
      bookTitle: bookTitle == freezed
          ? _value.bookTitle
          : bookTitle as BookTitleFilter,
    ));
  }
}

/// @nodoc
class _$_ByBookTitle implements _ByBookTitle {
  const _$_ByBookTitle({@required this.bookTitle}) : assert(bookTitle != null);

  @override
  final BookTitleFilter bookTitle;

  @override
  String toString() {
    return 'HighlighSearchFilter.byBookTitle(bookTitle: $bookTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ByBookTitle &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bookTitle);

  @JsonKey(ignore: true)
  @override
  _$ByBookTitleCopyWith<_ByBookTitle> get copyWith =>
      __$ByBookTitleCopyWithImpl<_ByBookTitle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult byBookTitle(BookTitleFilter bookTitle),
  }) {
    assert(byBookTitle != null);
    return byBookTitle(bookTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult byBookTitle(BookTitleFilter bookTitle),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (byBookTitle != null) {
      return byBookTitle(bookTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult byBookTitle(_ByBookTitle value),
  }) {
    assert(byBookTitle != null);
    return byBookTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult byBookTitle(_ByBookTitle value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (byBookTitle != null) {
      return byBookTitle(this);
    }
    return orElse();
  }
}

abstract class _ByBookTitle implements HighlighSearchFilter {
  const factory _ByBookTitle({@required BookTitleFilter bookTitle}) =
      _$_ByBookTitle;

  @override
  BookTitleFilter get bookTitle;
  @override
  @JsonKey(ignore: true)
  _$ByBookTitleCopyWith<_ByBookTitle> get copyWith;
}
