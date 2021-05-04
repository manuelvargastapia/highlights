// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HighlightDto _$HighlightDtoFromJson(Map<String, dynamic> json) {
  return _HighlightDto.fromJson(json);
}

/// @nodoc
class _$HighlightDtoTearOff {
  const _$HighlightDtoTearOff();

// ignore: unused_element
  _HighlightDto call(
      {@JsonKey(ignore: true) String id,
      @required String quote,
      @required int color,
      @required @ImageDtoConverter() ImageDto image,
      @required String bookTitle,
      @required String pageNumber,
      @required @ServerTimestampConverter() FieldValue serverTimestamp}) {
    return _HighlightDto(
      id: id,
      quote: quote,
      color: color,
      image: image,
      bookTitle: bookTitle,
      pageNumber: pageNumber,
      serverTimestamp: serverTimestamp,
    );
  }

// ignore: unused_element
  HighlightDto fromJson(Map<String, Object> json) {
    return HighlightDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightDto = _$HighlightDtoTearOff();

/// @nodoc
mixin _$HighlightDto {
  @JsonKey(ignore: true)
  String get id;
  String get quote;
  int get color;
  @ImageDtoConverter()
  ImageDto get image;
  String get bookTitle;
  String get pageNumber;
  @ServerTimestampConverter()
  FieldValue get serverTimestamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $HighlightDtoCopyWith<HighlightDto> get copyWith;
}

/// @nodoc
abstract class $HighlightDtoCopyWith<$Res> {
  factory $HighlightDtoCopyWith(
          HighlightDto value, $Res Function(HighlightDto) then) =
      _$HighlightDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String quote,
      int color,
      @ImageDtoConverter() ImageDto image,
      String bookTitle,
      String pageNumber,
      @ServerTimestampConverter() FieldValue serverTimestamp});

  $ImageDtoCopyWith<$Res> get image;
}

/// @nodoc
class _$HighlightDtoCopyWithImpl<$Res> implements $HighlightDtoCopyWith<$Res> {
  _$HighlightDtoCopyWithImpl(this._value, this._then);

  final HighlightDto _value;
  // ignore: unused_field
  final $Res Function(HighlightDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object quote = freezed,
    Object color = freezed,
    Object image = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
    Object serverTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      quote: quote == freezed ? _value.quote : quote as String,
      color: color == freezed ? _value.color : color as int,
      image: image == freezed ? _value.image : image as ImageDto,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as String,
      serverTimestamp: serverTimestamp == freezed
          ? _value.serverTimestamp
          : serverTimestamp as FieldValue,
    ));
  }

  @override
  $ImageDtoCopyWith<$Res> get image {
    if (_value.image == null) {
      return null;
    }
    return $ImageDtoCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$HighlightDtoCopyWith<$Res>
    implements $HighlightDtoCopyWith<$Res> {
  factory _$HighlightDtoCopyWith(
          _HighlightDto value, $Res Function(_HighlightDto) then) =
      __$HighlightDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String quote,
      int color,
      @ImageDtoConverter() ImageDto image,
      String bookTitle,
      String pageNumber,
      @ServerTimestampConverter() FieldValue serverTimestamp});

  @override
  $ImageDtoCopyWith<$Res> get image;
}

/// @nodoc
class __$HighlightDtoCopyWithImpl<$Res> extends _$HighlightDtoCopyWithImpl<$Res>
    implements _$HighlightDtoCopyWith<$Res> {
  __$HighlightDtoCopyWithImpl(
      _HighlightDto _value, $Res Function(_HighlightDto) _then)
      : super(_value, (v) => _then(v as _HighlightDto));

  @override
  _HighlightDto get _value => super._value as _HighlightDto;

  @override
  $Res call({
    Object id = freezed,
    Object quote = freezed,
    Object color = freezed,
    Object image = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
    Object serverTimestamp = freezed,
  }) {
    return _then(_HighlightDto(
      id: id == freezed ? _value.id : id as String,
      quote: quote == freezed ? _value.quote : quote as String,
      color: color == freezed ? _value.color : color as int,
      image: image == freezed ? _value.image : image as ImageDto,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as String,
      serverTimestamp: serverTimestamp == freezed
          ? _value.serverTimestamp
          : serverTimestamp as FieldValue,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_HighlightDto extends _HighlightDto {
  const _$_HighlightDto(
      {@JsonKey(ignore: true) this.id,
      @required this.quote,
      @required this.color,
      @required @ImageDtoConverter() this.image,
      @required this.bookTitle,
      @required this.pageNumber,
      @required @ServerTimestampConverter() this.serverTimestamp})
      : assert(quote != null),
        assert(color != null),
        assert(image != null),
        assert(bookTitle != null),
        assert(pageNumber != null),
        assert(serverTimestamp != null),
        super._();

  factory _$_HighlightDto.fromJson(Map<String, dynamic> json) =>
      _$_$_HighlightDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String quote;
  @override
  final int color;
  @override
  @ImageDtoConverter()
  final ImageDto image;
  @override
  final String bookTitle;
  @override
  final String pageNumber;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimestamp;

  @override
  String toString() {
    return 'HighlightDto(id: $id, quote: $quote, color: $color, image: $image, bookTitle: $bookTitle, pageNumber: $pageNumber, serverTimestamp: $serverTimestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlightDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.quote, quote) ||
                const DeepCollectionEquality().equals(other.quote, quote)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.serverTimestamp, serverTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimestamp, serverTimestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(quote) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(serverTimestamp);

  @JsonKey(ignore: true)
  @override
  _$HighlightDtoCopyWith<_HighlightDto> get copyWith =>
      __$HighlightDtoCopyWithImpl<_HighlightDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HighlightDtoToJson(this);
  }
}

abstract class _HighlightDto extends HighlightDto {
  const _HighlightDto._() : super._();
  const factory _HighlightDto(
          {@JsonKey(ignore: true) String id,
          @required String quote,
          @required int color,
          @required @ImageDtoConverter() ImageDto image,
          @required String bookTitle,
          @required String pageNumber,
          @required @ServerTimestampConverter() FieldValue serverTimestamp}) =
      _$_HighlightDto;

  factory _HighlightDto.fromJson(Map<String, dynamic> json) =
      _$_HighlightDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get quote;
  @override
  int get color;
  @override
  @ImageDtoConverter()
  ImageDto get image;
  @override
  String get bookTitle;
  @override
  String get pageNumber;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimestamp;
  @override
  @JsonKey(ignore: true)
  _$HighlightDtoCopyWith<_HighlightDto> get copyWith;
}
