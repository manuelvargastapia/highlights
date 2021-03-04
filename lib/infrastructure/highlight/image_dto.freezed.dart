// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ImageDtoTearOff {
  const _$ImageDtoTearOff();

// ignore: unused_element
  _ImageDto call({@required String imageUrl, @required String imageFile}) {
    return _ImageDto(
      imageUrl: imageUrl,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ImageDto = _$ImageDtoTearOff();

/// @nodoc
mixin _$ImageDto {
  String get imageUrl;
  String get imageFile;

  @JsonKey(ignore: true)
  $ImageDtoCopyWith<ImageDto> get copyWith;
}

/// @nodoc
abstract class $ImageDtoCopyWith<$Res> {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) then) =
      _$ImageDtoCopyWithImpl<$Res>;
  $Res call({String imageUrl, String imageFile});
}

/// @nodoc
class _$ImageDtoCopyWithImpl<$Res> implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._value, this._then);

  final ImageDto _value;
  // ignore: unused_field
  final $Res Function(ImageDto) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as String,
    ));
  }
}

/// @nodoc
abstract class _$ImageDtoCopyWith<$Res> implements $ImageDtoCopyWith<$Res> {
  factory _$ImageDtoCopyWith(_ImageDto value, $Res Function(_ImageDto) then) =
      __$ImageDtoCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl, String imageFile});
}

/// @nodoc
class __$ImageDtoCopyWithImpl<$Res> extends _$ImageDtoCopyWithImpl<$Res>
    implements _$ImageDtoCopyWith<$Res> {
  __$ImageDtoCopyWithImpl(_ImageDto _value, $Res Function(_ImageDto) _then)
      : super(_value, (v) => _then(v as _ImageDto));

  @override
  _ImageDto get _value => super._value as _ImageDto;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_ImageDto(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as String,
    ));
  }
}

/// @nodoc
class _$_ImageDto extends _ImageDto {
  const _$_ImageDto({@required this.imageUrl, @required this.imageFile})
      : assert(imageUrl != null),
        assert(imageFile != null),
        super._();

  @override
  final String imageUrl;
  @override
  final String imageFile;

  @override
  String toString() {
    return 'ImageDto(imageUrl: $imageUrl, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageDto &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  _$ImageDtoCopyWith<_ImageDto> get copyWith =>
      __$ImageDtoCopyWithImpl<_ImageDto>(this, _$identity);
}

abstract class _ImageDto extends ImageDto {
  const _ImageDto._() : super._();
  const factory _ImageDto(
      {@required String imageUrl, @required String imageFile}) = _$_ImageDto;

  @override
  String get imageUrl;
  @override
  String get imageFile;
  @override
  @JsonKey(ignore: true)
  _$ImageDtoCopyWith<_ImageDto> get copyWith;
}
