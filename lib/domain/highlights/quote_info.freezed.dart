// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'quote_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QuoteInfoTearOff {
  const _$QuoteInfoTearOff();

// ignore: unused_element
  _QuoteInfo call(
      {@required UniqueId id,
      @required BookTitle bookTitle,
      @required QuotePage pageNumber}) {
    return _QuoteInfo(
      id: id,
      bookTitle: bookTitle,
      pageNumber: pageNumber,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $QuoteInfo = _$QuoteInfoTearOff();

/// @nodoc
mixin _$QuoteInfo {
  UniqueId get id;
  BookTitle get bookTitle;
  QuotePage get pageNumber;

  @JsonKey(ignore: true)
  $QuoteInfoCopyWith<QuoteInfo> get copyWith;
}

/// @nodoc
abstract class $QuoteInfoCopyWith<$Res> {
  factory $QuoteInfoCopyWith(QuoteInfo value, $Res Function(QuoteInfo) then) =
      _$QuoteInfoCopyWithImpl<$Res>;
  $Res call({UniqueId id, BookTitle bookTitle, QuotePage pageNumber});
}

/// @nodoc
class _$QuoteInfoCopyWithImpl<$Res> implements $QuoteInfoCopyWith<$Res> {
  _$QuoteInfoCopyWithImpl(this._value, this._then);

  final QuoteInfo _value;
  // ignore: unused_field
  final $Res Function(QuoteInfo) _then;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      bookTitle:
          bookTitle == freezed ? _value.bookTitle : bookTitle as BookTitle,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as QuotePage,
    ));
  }
}

/// @nodoc
abstract class _$QuoteInfoCopyWith<$Res> implements $QuoteInfoCopyWith<$Res> {
  factory _$QuoteInfoCopyWith(
          _QuoteInfo value, $Res Function(_QuoteInfo) then) =
      __$QuoteInfoCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, BookTitle bookTitle, QuotePage pageNumber});
}

/// @nodoc
class __$QuoteInfoCopyWithImpl<$Res> extends _$QuoteInfoCopyWithImpl<$Res>
    implements _$QuoteInfoCopyWith<$Res> {
  __$QuoteInfoCopyWithImpl(_QuoteInfo _value, $Res Function(_QuoteInfo) _then)
      : super(_value, (v) => _then(v as _QuoteInfo));

  @override
  _QuoteInfo get _value => super._value as _QuoteInfo;

  @override
  $Res call({
    Object id = freezed,
    Object bookTitle = freezed,
    Object pageNumber = freezed,
  }) {
    return _then(_QuoteInfo(
      id: id == freezed ? _value.id : id as UniqueId,
      bookTitle:
          bookTitle == freezed ? _value.bookTitle : bookTitle as BookTitle,
      pageNumber:
          pageNumber == freezed ? _value.pageNumber : pageNumber as QuotePage,
    ));
  }
}

/// @nodoc
class _$_QuoteInfo extends _QuoteInfo {
  const _$_QuoteInfo(
      {@required this.id, @required this.bookTitle, @required this.pageNumber})
      : assert(id != null),
        assert(bookTitle != null),
        assert(pageNumber != null),
        super._();

  @override
  final UniqueId id;
  @override
  final BookTitle bookTitle;
  @override
  final QuotePage pageNumber;

  @override
  String toString() {
    return 'QuoteInfo(id: $id, bookTitle: $bookTitle, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuoteInfo &&
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
  _$QuoteInfoCopyWith<_QuoteInfo> get copyWith =>
      __$QuoteInfoCopyWithImpl<_QuoteInfo>(this, _$identity);
}

abstract class _QuoteInfo extends QuoteInfo {
  const _QuoteInfo._() : super._();
  const factory _QuoteInfo(
      {@required UniqueId id,
      @required BookTitle bookTitle,
      @required QuotePage pageNumber}) = _$_QuoteInfo;

  @override
  UniqueId get id;
  @override
  BookTitle get bookTitle;
  @override
  QuotePage get pageNumber;
  @override
  @JsonKey(ignore: true)
  _$QuoteInfoCopyWith<_QuoteInfo> get copyWith;
}
