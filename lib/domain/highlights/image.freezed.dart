// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ImageTearOff {
  const _$ImageTearOff();

// ignore: unused_element
  _Image call(
      {@required Option<ImageUrl> imageUrl,
      @required Option<ImageFile> imageFile}) {
    return _Image(
      imageUrl: imageUrl,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Image = _$ImageTearOff();

/// @nodoc
mixin _$Image {
  Option<ImageUrl> get imageUrl;
  Option<ImageFile> get imageFile;

  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res>;
  $Res call({Option<ImageUrl> imageUrl, Option<ImageFile> imageFile});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res> implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  final Image _value;
  // ignore: unused_field
  final $Res Function(Image) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl:
          imageUrl == freezed ? _value.imageUrl : imageUrl as Option<ImageUrl>,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile as Option<ImageFile>,
    ));
  }
}

/// @nodoc
abstract class _$ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) then) =
      __$ImageCopyWithImpl<$Res>;
  @override
  $Res call({Option<ImageUrl> imageUrl, Option<ImageFile> imageFile});
}

/// @nodoc
class __$ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(_Image _value, $Res Function(_Image) _then)
      : super(_value, (v) => _then(v as _Image));

  @override
  _Image get _value => super._value as _Image;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_Image(
      imageUrl:
          imageUrl == freezed ? _value.imageUrl : imageUrl as Option<ImageUrl>,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile as Option<ImageFile>,
    ));
  }
}

/// @nodoc
class _$_Image extends _Image {
  const _$_Image({@required this.imageUrl, @required this.imageFile})
      : assert(imageUrl != null),
        assert(imageFile != null),
        super._();

  @override
  final Option<ImageUrl> imageUrl;
  @override
  final Option<ImageFile> imageFile;

  @override
  String toString() {
    return 'Image(imageUrl: $imageUrl, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Image &&
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
  _$ImageCopyWith<_Image> get copyWith =>
      __$ImageCopyWithImpl<_Image>(this, _$identity);
}

abstract class _Image extends Image {
  const _Image._() : super._();
  const factory _Image(
      {@required Option<ImageUrl> imageUrl,
      @required Option<ImageFile> imageFile}) = _$_Image;

  @override
  Option<ImageUrl> get imageUrl;
  @override
  Option<ImageFile> get imageFile;
  @override
  @JsonKey(ignore: true)
  _$ImageCopyWith<_Image> get copyWith;
}
