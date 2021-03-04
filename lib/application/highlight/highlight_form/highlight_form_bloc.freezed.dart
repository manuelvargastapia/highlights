// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'highlight_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HighlightFormEventTearOff {
  const _$HighlightFormEventTearOff();

// ignore: unused_element
  _Initialized initialized(Option<Highlight> initialHighlighOption) {
    return _Initialized(
      initialHighlighOption,
    );
  }

// ignore: unused_element
  _QuoteChange quoteChange(String quote) {
    return _QuoteChange(
      quote,
    );
  }

// ignore: unused_element
  _ColorChange colorChange(Color color) {
    return _ColorChange(
      color,
    );
  }

// ignore: unused_element
  _BookTitleChanged bookTitleChanged(String bookTitle) {
    return _BookTitleChanged(
      bookTitle,
    );
  }

// ignore: unused_element
  _PageNumberChanged pageNumberChanged(String pageNumber) {
    return _PageNumberChanged(
      pageNumber,
    );
  }

// ignore: unused_element
  _ImageChanged imageChanged(ImagePrimitive image) {
    return _ImageChanged(
      image,
    );
  }

// ignore: unused_element
  _ImageDeleted imageDeleted() {
    return const _ImageDeleted();
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightFormEvent = _$HighlightFormEventTearOff();

/// @nodoc
mixin _$HighlightFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $HighlightFormEventCopyWith<$Res> {
  factory $HighlightFormEventCopyWith(
          HighlightFormEvent value, $Res Function(HighlightFormEvent) then) =
      _$HighlightFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HighlightFormEventCopyWithImpl<$Res>
    implements $HighlightFormEventCopyWith<$Res> {
  _$HighlightFormEventCopyWithImpl(this._value, this._then);

  final HighlightFormEvent _value;
  // ignore: unused_field
  final $Res Function(HighlightFormEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Highlight> initialHighlighOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object initialHighlighOption = freezed,
  }) {
    return _then(_Initialized(
      initialHighlighOption == freezed
          ? _value.initialHighlighOption
          : initialHighlighOption as Option<Highlight>,
    ));
  }
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialHighlighOption)
      : assert(initialHighlighOption != null);

  @override
  final Option<Highlight> initialHighlighOption;

  @override
  String toString() {
    return 'HighlightFormEvent.initialized(initialHighlighOption: $initialHighlighOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.initialHighlighOption, initialHighlighOption) ||
                const DeepCollectionEquality().equals(
                    other.initialHighlighOption, initialHighlighOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialHighlighOption);

  @JsonKey(ignore: true)
  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return initialized(initialHighlighOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(initialHighlighOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements HighlightFormEvent {
  const factory _Initialized(Option<Highlight> initialHighlighOption) =
      _$_Initialized;

  Option<Highlight> get initialHighlighOption;
  @JsonKey(ignore: true)
  _$InitializedCopyWith<_Initialized> get copyWith;
}

/// @nodoc
abstract class _$QuoteChangeCopyWith<$Res> {
  factory _$QuoteChangeCopyWith(
          _QuoteChange value, $Res Function(_QuoteChange) then) =
      __$QuoteChangeCopyWithImpl<$Res>;
  $Res call({String quote});
}

/// @nodoc
class __$QuoteChangeCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$QuoteChangeCopyWith<$Res> {
  __$QuoteChangeCopyWithImpl(
      _QuoteChange _value, $Res Function(_QuoteChange) _then)
      : super(_value, (v) => _then(v as _QuoteChange));

  @override
  _QuoteChange get _value => super._value as _QuoteChange;

  @override
  $Res call({
    Object quote = freezed,
  }) {
    return _then(_QuoteChange(
      quote == freezed ? _value.quote : quote as String,
    ));
  }
}

/// @nodoc
class _$_QuoteChange implements _QuoteChange {
  const _$_QuoteChange(this.quote) : assert(quote != null);

  @override
  final String quote;

  @override
  String toString() {
    return 'HighlightFormEvent.quoteChange(quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuoteChange &&
            (identical(other.quote, quote) ||
                const DeepCollectionEquality().equals(other.quote, quote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quote);

  @JsonKey(ignore: true)
  @override
  _$QuoteChangeCopyWith<_QuoteChange> get copyWith =>
      __$QuoteChangeCopyWithImpl<_QuoteChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return quoteChange(quote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (quoteChange != null) {
      return quoteChange(quote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return quoteChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (quoteChange != null) {
      return quoteChange(this);
    }
    return orElse();
  }
}

abstract class _QuoteChange implements HighlightFormEvent {
  const factory _QuoteChange(String quote) = _$_QuoteChange;

  String get quote;
  @JsonKey(ignore: true)
  _$QuoteChangeCopyWith<_QuoteChange> get copyWith;
}

/// @nodoc
abstract class _$ColorChangeCopyWith<$Res> {
  factory _$ColorChangeCopyWith(
          _ColorChange value, $Res Function(_ColorChange) then) =
      __$ColorChangeCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class __$ColorChangeCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$ColorChangeCopyWith<$Res> {
  __$ColorChangeCopyWithImpl(
      _ColorChange _value, $Res Function(_ColorChange) _then)
      : super(_value, (v) => _then(v as _ColorChange));

  @override
  _ColorChange get _value => super._value as _ColorChange;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_ColorChange(
      color == freezed ? _value.color : color as Color,
    ));
  }
}

/// @nodoc
class _$_ColorChange implements _ColorChange {
  const _$_ColorChange(this.color) : assert(color != null);

  @override
  final Color color;

  @override
  String toString() {
    return 'HighlightFormEvent.colorChange(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorChange &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @JsonKey(ignore: true)
  @override
  _$ColorChangeCopyWith<_ColorChange> get copyWith =>
      __$ColorChangeCopyWithImpl<_ColorChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return colorChange(color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (colorChange != null) {
      return colorChange(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return colorChange(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (colorChange != null) {
      return colorChange(this);
    }
    return orElse();
  }
}

abstract class _ColorChange implements HighlightFormEvent {
  const factory _ColorChange(Color color) = _$_ColorChange;

  Color get color;
  @JsonKey(ignore: true)
  _$ColorChangeCopyWith<_ColorChange> get copyWith;
}

/// @nodoc
abstract class _$BookTitleChangedCopyWith<$Res> {
  factory _$BookTitleChangedCopyWith(
          _BookTitleChanged value, $Res Function(_BookTitleChanged) then) =
      __$BookTitleChangedCopyWithImpl<$Res>;
  $Res call({String bookTitle});
}

/// @nodoc
class __$BookTitleChangedCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$BookTitleChangedCopyWith<$Res> {
  __$BookTitleChangedCopyWithImpl(
      _BookTitleChanged _value, $Res Function(_BookTitleChanged) _then)
      : super(_value, (v) => _then(v as _BookTitleChanged));

  @override
  _BookTitleChanged get _value => super._value as _BookTitleChanged;

  @override
  $Res call({
    Object bookTitle = freezed,
  }) {
    return _then(_BookTitleChanged(
      bookTitle == freezed ? _value.bookTitle : bookTitle as String,
    ));
  }
}

/// @nodoc
class _$_BookTitleChanged implements _BookTitleChanged {
  const _$_BookTitleChanged(this.bookTitle) : assert(bookTitle != null);

  @override
  final String bookTitle;

  @override
  String toString() {
    return 'HighlightFormEvent.bookTitleChanged(bookTitle: $bookTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookTitleChanged &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bookTitle);

  @JsonKey(ignore: true)
  @override
  _$BookTitleChangedCopyWith<_BookTitleChanged> get copyWith =>
      __$BookTitleChangedCopyWithImpl<_BookTitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return bookTitleChanged(bookTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (bookTitleChanged != null) {
      return bookTitleChanged(bookTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return bookTitleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (bookTitleChanged != null) {
      return bookTitleChanged(this);
    }
    return orElse();
  }
}

abstract class _BookTitleChanged implements HighlightFormEvent {
  const factory _BookTitleChanged(String bookTitle) = _$_BookTitleChanged;

  String get bookTitle;
  @JsonKey(ignore: true)
  _$BookTitleChangedCopyWith<_BookTitleChanged> get copyWith;
}

/// @nodoc
abstract class _$PageNumberChangedCopyWith<$Res> {
  factory _$PageNumberChangedCopyWith(
          _PageNumberChanged value, $Res Function(_PageNumberChanged) then) =
      __$PageNumberChangedCopyWithImpl<$Res>;
  $Res call({String pageNumber});
}

/// @nodoc
class __$PageNumberChangedCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$PageNumberChangedCopyWith<$Res> {
  __$PageNumberChangedCopyWithImpl(
      _PageNumberChanged _value, $Res Function(_PageNumberChanged) _then)
      : super(_value, (v) => _then(v as _PageNumberChanged));

  @override
  _PageNumberChanged get _value => super._value as _PageNumberChanged;

  @override
  $Res call({
    Object pageNumber = freezed,
  }) {
    return _then(_PageNumberChanged(
      pageNumber == freezed ? _value.pageNumber : pageNumber as String,
    ));
  }
}

/// @nodoc
class _$_PageNumberChanged implements _PageNumberChanged {
  const _$_PageNumberChanged(this.pageNumber) : assert(pageNumber != null);

  @override
  final String pageNumber;

  @override
  String toString() {
    return 'HighlightFormEvent.pageNumberChanged(pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PageNumberChanged &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pageNumber);

  @JsonKey(ignore: true)
  @override
  _$PageNumberChangedCopyWith<_PageNumberChanged> get copyWith =>
      __$PageNumberChangedCopyWithImpl<_PageNumberChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return pageNumberChanged(pageNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pageNumberChanged != null) {
      return pageNumberChanged(pageNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return pageNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pageNumberChanged != null) {
      return pageNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _PageNumberChanged implements HighlightFormEvent {
  const factory _PageNumberChanged(String pageNumber) = _$_PageNumberChanged;

  String get pageNumber;
  @JsonKey(ignore: true)
  _$PageNumberChangedCopyWith<_PageNumberChanged> get copyWith;
}

/// @nodoc
abstract class _$ImageChangedCopyWith<$Res> {
  factory _$ImageChangedCopyWith(
          _ImageChanged value, $Res Function(_ImageChanged) then) =
      __$ImageChangedCopyWithImpl<$Res>;
  $Res call({ImagePrimitive image});

  $ImagePrimitiveCopyWith<$Res> get image;
}

/// @nodoc
class __$ImageChangedCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$ImageChangedCopyWith<$Res> {
  __$ImageChangedCopyWithImpl(
      _ImageChanged _value, $Res Function(_ImageChanged) _then)
      : super(_value, (v) => _then(v as _ImageChanged));

  @override
  _ImageChanged get _value => super._value as _ImageChanged;

  @override
  $Res call({
    Object image = freezed,
  }) {
    return _then(_ImageChanged(
      image == freezed ? _value.image : image as ImagePrimitive,
    ));
  }

  @override
  $ImagePrimitiveCopyWith<$Res> get image {
    if (_value.image == null) {
      return null;
    }
    return $ImagePrimitiveCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
class _$_ImageChanged implements _ImageChanged {
  const _$_ImageChanged(this.image) : assert(image != null);

  @override
  final ImagePrimitive image;

  @override
  String toString() {
    return 'HighlightFormEvent.imageChanged(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageChanged &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$ImageChangedCopyWith<_ImageChanged> get copyWith =>
      __$ImageChangedCopyWithImpl<_ImageChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return imageChanged(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageChanged != null) {
      return imageChanged(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class _ImageChanged implements HighlightFormEvent {
  const factory _ImageChanged(ImagePrimitive image) = _$_ImageChanged;

  ImagePrimitive get image;
  @JsonKey(ignore: true)
  _$ImageChangedCopyWith<_ImageChanged> get copyWith;
}

/// @nodoc
abstract class _$ImageDeletedCopyWith<$Res> {
  factory _$ImageDeletedCopyWith(
          _ImageDeleted value, $Res Function(_ImageDeleted) then) =
      __$ImageDeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ImageDeletedCopyWithImpl<$Res>
    extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$ImageDeletedCopyWith<$Res> {
  __$ImageDeletedCopyWithImpl(
      _ImageDeleted _value, $Res Function(_ImageDeleted) _then)
      : super(_value, (v) => _then(v as _ImageDeleted));

  @override
  _ImageDeleted get _value => super._value as _ImageDeleted;
}

/// @nodoc
class _$_ImageDeleted implements _ImageDeleted {
  const _$_ImageDeleted();

  @override
  String toString() {
    return 'HighlightFormEvent.imageDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ImageDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return imageDeleted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageDeleted != null) {
      return imageDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return imageDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (imageDeleted != null) {
      return imageDeleted(this);
    }
    return orElse();
  }
}

abstract class _ImageDeleted implements HighlightFormEvent {
  const factory _ImageDeleted() = _$_ImageDeleted;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$HighlightFormEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'HighlightFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialized(Option<Highlight> initialHighlighOption),
    @required TResult quoteChange(String quote),
    @required TResult colorChange(Color color),
    @required TResult bookTitleChanged(String bookTitle),
    @required TResult pageNumberChanged(String pageNumber),
    @required TResult imageChanged(ImagePrimitive image),
    @required TResult imageDeleted(),
    @required TResult saved(),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialized(Option<Highlight> initialHighlighOption),
    TResult quoteChange(String quote),
    TResult colorChange(Color color),
    TResult bookTitleChanged(String bookTitle),
    TResult pageNumberChanged(String pageNumber),
    TResult imageChanged(ImagePrimitive image),
    TResult imageDeleted(),
    TResult saved(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialized(_Initialized value),
    @required TResult quoteChange(_QuoteChange value),
    @required TResult colorChange(_ColorChange value),
    @required TResult bookTitleChanged(_BookTitleChanged value),
    @required TResult pageNumberChanged(_PageNumberChanged value),
    @required TResult imageChanged(_ImageChanged value),
    @required TResult imageDeleted(_ImageDeleted value),
    @required TResult saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(quoteChange != null);
    assert(colorChange != null);
    assert(bookTitleChanged != null);
    assert(pageNumberChanged != null);
    assert(imageChanged != null);
    assert(imageDeleted != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialized(_Initialized value),
    TResult quoteChange(_QuoteChange value),
    TResult colorChange(_ColorChange value),
    TResult bookTitleChanged(_BookTitleChanged value),
    TResult pageNumberChanged(_PageNumberChanged value),
    TResult imageChanged(_ImageChanged value),
    TResult imageDeleted(_ImageDeleted value),
    TResult saved(_Saved value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements HighlightFormEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$HighlightFormStateTearOff {
  const _$HighlightFormStateTearOff();

// ignore: unused_element
  _HighlightFormState call(
      {@required
          Highlight highlight,
      @required
          bool isEditing,
      @required
          bool isProcessingImage,
      @required
          bool isSaving,
      @required
          Option<Either<HighlightFailure, Unit>> saveFailureOrSuccessOption}) {
    return _HighlightFormState(
      highlight: highlight,
      isEditing: isEditing,
      isProcessingImage: isProcessingImage,
      isSaving: isSaving,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HighlightFormState = _$HighlightFormStateTearOff();

/// @nodoc
mixin _$HighlightFormState {
  Highlight get highlight;
  bool get isEditing;
  bool get isProcessingImage;
  bool get isSaving;
  Option<Either<HighlightFailure, Unit>> get saveFailureOrSuccessOption;

  @JsonKey(ignore: true)
  $HighlightFormStateCopyWith<HighlightFormState> get copyWith;
}

/// @nodoc
abstract class $HighlightFormStateCopyWith<$Res> {
  factory $HighlightFormStateCopyWith(
          HighlightFormState value, $Res Function(HighlightFormState) then) =
      _$HighlightFormStateCopyWithImpl<$Res>;
  $Res call(
      {Highlight highlight,
      bool isEditing,
      bool isProcessingImage,
      bool isSaving,
      Option<Either<HighlightFailure, Unit>> saveFailureOrSuccessOption});

  $HighlightCopyWith<$Res> get highlight;
}

/// @nodoc
class _$HighlightFormStateCopyWithImpl<$Res>
    implements $HighlightFormStateCopyWith<$Res> {
  _$HighlightFormStateCopyWithImpl(this._value, this._then);

  final HighlightFormState _value;
  // ignore: unused_field
  final $Res Function(HighlightFormState) _then;

  @override
  $Res call({
    Object highlight = freezed,
    Object isEditing = freezed,
    Object isProcessingImage = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      highlight:
          highlight == freezed ? _value.highlight : highlight as Highlight,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isProcessingImage: isProcessingImage == freezed
          ? _value.isProcessingImage
          : isProcessingImage as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption
              as Option<Either<HighlightFailure, Unit>>,
    ));
  }

  @override
  $HighlightCopyWith<$Res> get highlight {
    if (_value.highlight == null) {
      return null;
    }
    return $HighlightCopyWith<$Res>(_value.highlight, (value) {
      return _then(_value.copyWith(highlight: value));
    });
  }
}

/// @nodoc
abstract class _$HighlightFormStateCopyWith<$Res>
    implements $HighlightFormStateCopyWith<$Res> {
  factory _$HighlightFormStateCopyWith(
          _HighlightFormState value, $Res Function(_HighlightFormState) then) =
      __$HighlightFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Highlight highlight,
      bool isEditing,
      bool isProcessingImage,
      bool isSaving,
      Option<Either<HighlightFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $HighlightCopyWith<$Res> get highlight;
}

/// @nodoc
class __$HighlightFormStateCopyWithImpl<$Res>
    extends _$HighlightFormStateCopyWithImpl<$Res>
    implements _$HighlightFormStateCopyWith<$Res> {
  __$HighlightFormStateCopyWithImpl(
      _HighlightFormState _value, $Res Function(_HighlightFormState) _then)
      : super(_value, (v) => _then(v as _HighlightFormState));

  @override
  _HighlightFormState get _value => super._value as _HighlightFormState;

  @override
  $Res call({
    Object highlight = freezed,
    Object isEditing = freezed,
    Object isProcessingImage = freezed,
    Object isSaving = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_HighlightFormState(
      highlight:
          highlight == freezed ? _value.highlight : highlight as Highlight,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      isProcessingImage: isProcessingImage == freezed
          ? _value.isProcessingImage
          : isProcessingImage as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption
              as Option<Either<HighlightFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_HighlightFormState implements _HighlightFormState {
  const _$_HighlightFormState(
      {@required this.highlight,
      @required this.isEditing,
      @required this.isProcessingImage,
      @required this.isSaving,
      @required this.saveFailureOrSuccessOption})
      : assert(highlight != null),
        assert(isEditing != null),
        assert(isProcessingImage != null),
        assert(isSaving != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Highlight highlight;
  @override
  final bool isEditing;
  @override
  final bool isProcessingImage;
  @override
  final bool isSaving;
  @override
  final Option<Either<HighlightFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'HighlightFormState(highlight: $highlight, isEditing: $isEditing, isProcessingImage: $isProcessingImage, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HighlightFormState &&
            (identical(other.highlight, highlight) ||
                const DeepCollectionEquality()
                    .equals(other.highlight, highlight)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.isProcessingImage, isProcessingImage) ||
                const DeepCollectionEquality()
                    .equals(other.isProcessingImage, isProcessingImage)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(highlight) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(isProcessingImage) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$HighlightFormStateCopyWith<_HighlightFormState> get copyWith =>
      __$HighlightFormStateCopyWithImpl<_HighlightFormState>(this, _$identity);
}

abstract class _HighlightFormState implements HighlightFormState {
  const factory _HighlightFormState(
      {@required
          Highlight highlight,
      @required
          bool isEditing,
      @required
          bool isProcessingImage,
      @required
          bool isSaving,
      @required
          Option<Either<HighlightFailure, Unit>>
              saveFailureOrSuccessOption}) = _$_HighlightFormState;

  @override
  Highlight get highlight;
  @override
  bool get isEditing;
  @override
  bool get isProcessingImage;
  @override
  bool get isSaving;
  @override
  Option<Either<HighlightFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$HighlightFormStateCopyWith<_HighlightFormState> get copyWith;
}
