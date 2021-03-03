// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$QuoteTearOff {
  const _$QuoteTearOff();

// ignore: unused_element
  _Quote call({@required HighlightQuote highlightQuote}) {
    return _Quote(
      highlightQuote: highlightQuote,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Quote = _$QuoteTearOff();

/// @nodoc
mixin _$Quote {
  HighlightQuote get highlightQuote;

  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res>;
  $Res call({HighlightQuote highlightQuote});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res> implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  final Quote _value;
  // ignore: unused_field
  final $Res Function(Quote) _then;

  @override
  $Res call({
    Object highlightQuote = freezed,
  }) {
    return _then(_value.copyWith(
      highlightQuote: highlightQuote == freezed
          ? _value.highlightQuote
          : highlightQuote as HighlightQuote,
    ));
  }
}

/// @nodoc
abstract class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) then) =
      __$QuoteCopyWithImpl<$Res>;
  @override
  $Res call({HighlightQuote highlightQuote});
}

/// @nodoc
class __$QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(_Quote _value, $Res Function(_Quote) _then)
      : super(_value, (v) => _then(v as _Quote));

  @override
  _Quote get _value => super._value as _Quote;

  @override
  $Res call({
    Object highlightQuote = freezed,
  }) {
    return _then(_Quote(
      highlightQuote: highlightQuote == freezed
          ? _value.highlightQuote
          : highlightQuote as HighlightQuote,
    ));
  }
}

/// @nodoc
class _$_Quote extends _Quote {
  const _$_Quote({@required this.highlightQuote})
      : assert(highlightQuote != null),
        super._();

  @override
  final HighlightQuote highlightQuote;

  @override
  String toString() {
    return 'Quote(highlightQuote: $highlightQuote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quote &&
            (identical(other.highlightQuote, highlightQuote) ||
                const DeepCollectionEquality()
                    .equals(other.highlightQuote, highlightQuote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(highlightQuote);

  @JsonKey(ignore: true)
  @override
  _$QuoteCopyWith<_Quote> get copyWith =>
      __$QuoteCopyWithImpl<_Quote>(this, _$identity);
}

abstract class _Quote extends Quote {
  const _Quote._() : super._();
  const factory _Quote({@required HighlightQuote highlightQuote}) = _$_Quote;

  @override
  HighlightQuote get highlightQuote;
  @override
  @JsonKey(ignore: true)
  _$QuoteCopyWith<_Quote> get copyWith;
}
