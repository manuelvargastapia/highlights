// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'quote_info_presentation_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QuoteInfoPrimitiveTearOff {
  const _$QuoteInfoPrimitiveTearOff();

// ignore: unused_element
  _QuoteInfoPrimitive call(
      {@required UniqueId id,
      @required String bookTitle,
      @required int pageNumber}) {
    return _QuoteInfoPrimitive(
      id: id,
      bookTitle: bookTitle,
      pageNumber: pageNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QuoteInfoPrimitive = _$QuoteInfoPrimitiveTearOff();

/// @nodoc
mixin _$QuoteInfoPrimitive {
  UniqueId get id;
  String get bookTitle;
  int get pageNumber;

  @JsonKey(ignore: true)
  $QuoteInfoPrimitiveCopyWith<QuoteInfoPrimitive> get copyWith;
}

/// @nodoc
abstract class $QuoteInfoPrimitiveCopyWith<$Res> {
  factory $QuoteInfoPrimitiveCopyWith(
          QuoteInfoPrimitive value, $Res Function(QuoteInfoPrimitive) then) =
      _$QuoteInfoPrimitiveCopyWithImpl<$Res>;
  $Res call({UniqueId id, String bookTitle, int pageNumber});
}

/// @nodoc
class _$QuoteInfoPrimitiveCopyWithImpl<$Res>
    implements $QuoteInfoPrimitiveCopyWith<$Res> {
  _$QuoteInfoPrimitiveCopyWithImpl(this._value, this._then);

  final QuoteInfoPrimitive _value;
  // ignore: unused_field
  final $Res Function(QuoteInfoPrimitive) _then;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber: pageNumber == freezed ? _value.pageNumber : pageNumber as int,
    ));
  }
}

/// @nodoc
abstract class _$QuoteInfoPrimitiveCopyWith<$Res>
    implements $QuoteInfoPrimitiveCopyWith<$Res> {
  factory _$QuoteInfoPrimitiveCopyWith(
          _QuoteInfoPrimitive value, $Res Function(_QuoteInfoPrimitive) then) =
      __$QuoteInfoPrimitiveCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, String bookTitle, int pageNumber});
}

/// @nodoc
class __$QuoteInfoPrimitiveCopyWithImpl<$Res>
    extends _$QuoteInfoPrimitiveCopyWithImpl<$Res>
    implements _$QuoteInfoPrimitiveCopyWith<$Res> {
  __$QuoteInfoPrimitiveCopyWithImpl(
      _QuoteInfoPrimitive _value, $Res Function(_QuoteInfoPrimitive) _then)
      : super(_value, (v) => _then(v as _QuoteInfoPrimitive));

  @override
  _QuoteInfoPrimitive get _value => super._value as _QuoteInfoPrimitive;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_QuoteInfoPrimitive(
      id: id == freezed ? _value.id : id as UniqueId,
      bookTitle: bookTitle == freezed ? _value.bookTitle : bookTitle as String,
      pageNumber: pageNumber == freezed ? _value.pageNumber : pageNumber as int,
    ));
  }
}

/// @nodoc
class _$_QuoteInfoPrimitive extends _QuoteInfoPrimitive {
  const _$_QuoteInfoPrimitive(
      {@required this.id, @required this.bookTitle, @required this.pageNumber})
      : assert(id != null),
        assert(bookTitle != null),
        assert(pageNumber != null),
        super._();

  @override
  final UniqueId id;
  @override
  final String bookTitle;
  @override
  final int pageNumber;

  @override
  String toString() {
    return 'QuoteInfoPrimitive(id: $id, bookTitle: $bookTitle, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuoteInfoPrimitive &&
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
  _$QuoteInfoPrimitiveCopyWith<_QuoteInfoPrimitive> get copyWith =>
      __$QuoteInfoPrimitiveCopyWithImpl<_QuoteInfoPrimitive>(this, _$identity);
}

abstract class _QuoteInfoPrimitive extends QuoteInfoPrimitive {
  const _QuoteInfoPrimitive._() : super._();
  const factory _QuoteInfoPrimitive(
      {@required UniqueId id,
      @required String bookTitle,
      @required int pageNumber}) = _$_QuoteInfoPrimitive;

  @override
  UniqueId get id;
  @override
  String get bookTitle;
  @override
  int get pageNumber;
  @override
  @JsonKey(ignore: true)
  _$QuoteInfoPrimitiveCopyWith<_QuoteInfoPrimitive> get copyWith;
}
