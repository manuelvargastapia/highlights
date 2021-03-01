// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_presentation_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ImagePrimitiveTearOff {
  const _$ImagePrimitiveTearOff();

// ignore: unused_element
  _ImagePrimitive call({@required String imageUrl, @required File imageFile}) {
    return _ImagePrimitive(
      imageUrl: imageUrl,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ImagePrimitive = _$ImagePrimitiveTearOff();

/// @nodoc
mixin _$ImagePrimitive {
  String get imageUrl;
  File get imageFile;

  @JsonKey(ignore: true)
  $ImagePrimitiveCopyWith<ImagePrimitive> get copyWith;
}

/// @nodoc
abstract class $ImagePrimitiveCopyWith<$Res> {
  factory $ImagePrimitiveCopyWith(
          ImagePrimitive value, $Res Function(ImagePrimitive) then) =
      _$ImagePrimitiveCopyWithImpl<$Res>;
  $Res call({String imageUrl, File imageFile});
}

/// @nodoc
class _$ImagePrimitiveCopyWithImpl<$Res>
    implements $ImagePrimitiveCopyWith<$Res> {
  _$ImagePrimitiveCopyWithImpl(this._value, this._then);

  final ImagePrimitive _value;
  // ignore: unused_field
  final $Res Function(ImagePrimitive) _then;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }
}

/// @nodoc
abstract class _$ImagePrimitiveCopyWith<$Res>
    implements $ImagePrimitiveCopyWith<$Res> {
  factory _$ImagePrimitiveCopyWith(
          _ImagePrimitive value, $Res Function(_ImagePrimitive) then) =
      __$ImagePrimitiveCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl, File imageFile});
}

/// @nodoc
class __$ImagePrimitiveCopyWithImpl<$Res>
    extends _$ImagePrimitiveCopyWithImpl<$Res>
    implements _$ImagePrimitiveCopyWith<$Res> {
  __$ImagePrimitiveCopyWithImpl(
      _ImagePrimitive _value, $Res Function(_ImagePrimitive) _then)
      : super(_value, (v) => _then(v as _ImagePrimitive));

  @override
  _ImagePrimitive get _value => super._value as _ImagePrimitive;

  @override
  $Res call({
    Object imageUrl = freezed,
    Object imageFile = freezed,
  }) {
    return _then(_ImagePrimitive(
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
    ));
  }
}

/// @nodoc
class _$_ImagePrimitive implements _ImagePrimitive {
  const _$_ImagePrimitive({@required this.imageUrl, @required this.imageFile})
      : assert(imageUrl != null),
        assert(imageFile != null);

  @override
  final String imageUrl;
  @override
  final File imageFile;

  @override
  String toString() {
    return 'ImagePrimitive(imageUrl: $imageUrl, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImagePrimitive &&
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
  _$ImagePrimitiveCopyWith<_ImagePrimitive> get copyWith =>
      __$ImagePrimitiveCopyWithImpl<_ImagePrimitive>(this, _$identity);
}

abstract class _ImagePrimitive implements ImagePrimitive {
  const factory _ImagePrimitive(
      {@required String imageUrl,
      @required File imageFile}) = _$_ImagePrimitive;

  @override
  String get imageUrl;
  @override
  File get imageFile;
  @override
  @JsonKey(ignore: true)
  _$ImagePrimitiveCopyWith<_ImagePrimitive> get copyWith;
}
