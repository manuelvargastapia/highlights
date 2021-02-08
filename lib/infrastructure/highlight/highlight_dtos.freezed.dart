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
      @required String imageUrl,
      @required QuoteInfoDto info,
      @required @ServerTimestampConverter() FieldValue serverTimestamp}) {
    return _HighlightDto(
      id: id,
      quote: quote,
      color: color,
      imageUrl: imageUrl,
      info: info,
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
  String get imageUrl;
  QuoteInfoDto get info;
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
      String imageUrl,
      QuoteInfoDto info,
      @ServerTimestampConverter() FieldValue serverTimestamp});

  $QuoteInfoDtoCopyWith<$Res> get info;
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
    Object imageUrl = freezed,
    Object info = freezed,
    Object serverTimestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      quote: quote == freezed ? _value.quote : quote as String,
      color: color == freezed ? _value.color : color as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      info: info == freezed ? _value.info : info as QuoteInfoDto,
      serverTimestamp: serverTimestamp == freezed
          ? _value.serverTimestamp
          : serverTimestamp as FieldValue,
    ));
  }

  @override
  $QuoteInfoDtoCopyWith<$Res> get info {
    if (_value.info == null) {
      return null;
    }
    return $QuoteInfoDtoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
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
      String imageUrl,
      QuoteInfoDto info,
      @ServerTimestampConverter() FieldValue serverTimestamp});

  @override
  $QuoteInfoDtoCopyWith<$Res> get info;
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
    Object imageUrl = freezed,
    Object info = freezed,
    Object serverTimestamp = freezed,
  }) {
    return _then(_HighlightDto(
      id: id == freezed ? _value.id : id as String,
      quote: quote == freezed ? _value.quote : quote as String,
      color: color == freezed ? _value.color : color as int,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      info: info == freezed ? _value.info : info as QuoteInfoDto,
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
      @required this.imageUrl,
      @required this.info,
      @required @ServerTimestampConverter() this.serverTimestamp})
      : assert(quote != null),
        assert(color != null),
        assert(imageUrl != null),
        assert(info != null),
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
  final String imageUrl;
  @override
  final QuoteInfoDto info;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimestamp;

  @override
  String toString() {
    return 'HighlightDto(id: $id, quote: $quote, color: $color, imageUrl: $imageUrl, info: $info, serverTimestamp: $serverTimestamp)';
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
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)) &&
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
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(info) ^
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
          @required String imageUrl,
          @required QuoteInfoDto info,
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
  String get imageUrl;
  @override
  QuoteInfoDto get info;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimestamp;
  @override
  @JsonKey(ignore: true)
  _$HighlightDtoCopyWith<_HighlightDto> get copyWith;
}

QuoteInfoDto _$QuoteInfoDtoFromJson(Map<String, dynamic> json) {
  return _QuoteInfoDto.fromJson(json);
}

/// @nodoc
class _$QuoteInfoDtoTearOff {
  const _$QuoteInfoDtoTearOff();

// ignore: unused_element
  _QuoteInfoDto call(
      {@required String id,
      @required String bookTitle,
      @required int pageNumber}) {
    return _QuoteInfoDto(
      id: id,
      bookTitle: bookTitle,
      pageNumber: pageNumber,
    );
  }

// ignore: unused_element
  QuoteInfoDto fromJson(Map<String, Object> json) {
    return QuoteInfoDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $QuoteInfoDto = _$QuoteInfoDtoTearOff();

/// @nodoc
mixin _$QuoteInfoDto {
  String get id;
  String get bookTitle;
  int get pageNumber;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $QuoteInfoDtoCopyWith<QuoteInfoDto> get copyWith;
}

/// @nodoc
abstract class $QuoteInfoDtoCopyWith<$Res> {
  factory $QuoteInfoDtoCopyWith(
          QuoteInfoDto value, $Res Function(QuoteInfoDto) then) =
      _$QuoteInfoDtoCopyWithImpl<$Res>;
  $Res call({String id, String bookTitle, int pageNumber});
}

/// @nodoc
class _$QuoteInfoDtoCopyWithImpl<$Res> implements $QuoteInfoDtoCopyWith<$Res> {
  _$QuoteInfoDtoCopyWithImpl(this._value, this._then);

  final QuoteInfoDto _value;
  // ignore: unused_field
  final $Res Function(QuoteInfoDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber: pageNumber == freezed ? _value.pageNumber : pageNumber as int,
    ));
  }
}

/// @nodoc
abstract class _$QuoteInfoDtoCopyWith<$Res>
    implements $QuoteInfoDtoCopyWith<$Res> {
  factory _$QuoteInfoDtoCopyWith(
          _QuoteInfoDto value, $Res Function(_QuoteInfoDto) then) =
      __$QuoteInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String bookTitle, int pageNumber});
}

/// @nodoc
class __$QuoteInfoDtoCopyWithImpl<$Res> extends _$QuoteInfoDtoCopyWithImpl<$Res>
    implements _$QuoteInfoDtoCopyWith<$Res> {
  __$QuoteInfoDtoCopyWithImpl(
      _QuoteInfoDto _value, $Res Function(_QuoteInfoDto) _then)
      : super(_value, (v) => _then(v as _QuoteInfoDto));

  @override
  _QuoteInfoDto get _value => super._value as _QuoteInfoDto;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_QuoteInfoDto(
      id: id == freezed ? _value.id : id as String,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber: pageNumber == freezed ? _value.pageNumber : pageNumber as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_QuoteInfoDto extends _QuoteInfoDto {
  const _$_QuoteInfoDto(
      {@required this.id, @required this.bookTitle, @required this.pageNumber})
      : assert(id != null),
        assert(bookTitle != null),
        assert(pageNumber != null),
        super._();

  factory _$_QuoteInfoDto.fromJson(Map<String, dynamic> json) =>
      _$_$_QuoteInfoDtoFromJson(json);

  @override
  final String id;
  @override
  final String bookTitle;
  @override
  final int pageNumber;

  @override
  String toString() {
    return 'QuoteInfoDto(id: $id, bookTitle: $bookTitle, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuoteInfoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(pageNumber);

  @JsonKey(ignore: true)
  @override
  _$QuoteInfoDtoCopyWith<_QuoteInfoDto> get copyWith =>
      __$QuoteInfoDtoCopyWithImpl<_QuoteInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuoteInfoDtoToJson(this);
  }
}

abstract class _QuoteInfoDto extends QuoteInfoDto {
  const _QuoteInfoDto._() : super._();
  const factory _QuoteInfoDto(
      {@required String id,
      @required String bookTitle,
      @required int pageNumber}) = _$_QuoteInfoDto;

  factory _QuoteInfoDto.fromJson(Map<String, dynamic> json) =
      _$_QuoteInfoDto.fromJson;

  @override
  String get id;
  @override
  String get bookTitle;
  @override
  int get pageNumber;
  @override
  @JsonKey(ignore: true)
  _$QuoteInfoDtoCopyWith<_QuoteInfoDto> get copyWith;
}
