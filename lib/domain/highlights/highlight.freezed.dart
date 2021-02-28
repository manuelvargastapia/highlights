// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightTearOff {
  const _$HighlightTearOff();

// ignore: unused_element
  _Highlights call(
      {@required UniqueId id,
      @required HighlightQuote quote,
      @required HighlightColor color,
      @required ImageUrl imageUrl,
      @required BookTitle bookTitle,
      @required PageNumber pageNumber}) {
    return _Highlights(
      id: id,
      quote: quote,
      color: color,
      imageUrl: imageUrl,
      bookTitle: bookTitle,
      pageNumber: pageNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Highlight = _$HighlightTearOff();

/// @nodoc
mixin _$Highlight {
  UniqueId get id;
  HighlightQuote get quote;
  HighlightColor get color;
  ImageUrl get imageUrl;
  BookTitle get bookTitle;
  PageNumber get pageNumber;

  @JsonKey(ignore: true)
  $HighlightCopyWith<Highlight> get copyWith;
}

/// @nodoc
abstract class $HighlightCopyWith<$Res> {
  factory $HighlightCopyWith(Highlight value, $Res Function(Highlight) then) =
      _$HighlightCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      HighlightQuote quote,
      HighlightColor color,
      ImageUrl imageUrl,
      BookTitle bookTitle,
      PageNumber pageNumber});
}

/// @nodoc
class _$HighlightCopyWithImpl<$Res> implements $HighlightCopyWith<$Res> {
  _$HighlightCopyWithImpl(this._value, this._then);

  final Highlight _value;
  // ignore: unused_field
  final $Res Function(Highlight) _then;

  @override
  $Res call({
    Object id = freezed,
    Object quote = freezed,
    Object color = freezed,
    Object imageUrl = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      quote: quote == freezed ? _value.quote : quote as HighlightQuote,
      color: color == freezed ? _value.color : color as HighlightColor,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as ImageUrl,
      bookTitle:
          bookTitle == freezed ? _value.bookTitle : bookTitle as BookTitle,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as PageNumber,
    ));
  }
}

/// @nodoc
abstract class _$HighlightsCopyWith<$Res> implements $HighlightCopyWith<$Res> {
  factory _$HighlightsCopyWith(
          _Highlights value, $Res Function(_Highlights) then) =
      __$HighlightsCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      HighlightQuote quote,
      HighlightColor color,
      ImageUrl imageUrl,
      BookTitle bookTitle,
      PageNumber pageNumber});
}

/// @nodoc
class __$HighlightsCopyWithImpl<$Res> extends _$HighlightCopyWithImpl<$Res>
    implements _$HighlightsCopyWith<$Res> {
  __$HighlightsCopyWithImpl(
      _Highlights _value, $Res Function(_Highlights) _then)
      : super(_value, (v) => _then(v as _Highlights));

  @override
  _Highlights get _value => super._value as _Highlights;

  @override
  $Res call({
    Object id = freezed,
    Object quote = freezed,
    Object color = freezed,
    Object imageUrl = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_Highlights(
      id: id == freezed ? _value.id : id as UniqueId,
      quote: quote == freezed ? _value.quote : quote as HighlightQuote,
      color: color == freezed ? _value.color : color as HighlightColor,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as ImageUrl,
      bookTitle:
          bookTitle == freezed ? _value.bookTitle : bookTitle as BookTitle,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as PageNumber,
    ));
  }
}

/// @nodoc
class _$_Highlights extends _Highlights {
  const _$_Highlights(
      {@required this.id,
      @required this.quote,
      @required this.color,
      @required this.imageUrl,
      @required this.bookTitle,
      @required this.pageNumber})
      : assert(id != null),
        assert(quote != null),
        assert(color != null),
        assert(imageUrl != null),
        assert(bookTitle != null),
        assert(pageNumber != null),
        super._();

  @override
  final UniqueId id;
  @override
  final HighlightQuote quote;
  @override
  final HighlightColor color;
  @override
  final ImageUrl imageUrl;
  @override
  final BookTitle bookTitle;
  @override
  final PageNumber pageNumber;

  @override
  String toString() {
    return 'Highlight(id: $id, quote: $quote, color: $color, imageUrl: $imageUrl, bookTitle: $bookTitle, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Highlights &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.quote, quote) ||
                const DeepCollectionEquality().equals(other.quote, quote)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(quote) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(pageNumber);

  @JsonKey(ignore: true)
  @override
  _$HighlightsCopyWith<_Highlights> get copyWith =>
      __$HighlightsCopyWithImpl<_Highlights>(this, _$identity);
}

abstract class _Highlights extends Highlight {
  const _Highlights._() : super._();
  const factory _Highlights(
      {@required UniqueId id,
      @required HighlightQuote quote,
      @required HighlightColor color,
      @required ImageUrl imageUrl,
      @required BookTitle bookTitle,
      @required PageNumber pageNumber}) = _$_Highlights;

  @override
  UniqueId get id;
  @override
  HighlightQuote get quote;
  @override
  HighlightColor get color;
  @override
  ImageUrl get imageUrl;
  @override
  BookTitle get bookTitle;
  @override
  PageNumber get pageNumber;
  @override
  @JsonKey(ignore: true)
  _$HighlightsCopyWith<_Highlights> get copyWith;
}
