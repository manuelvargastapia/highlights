import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Mixin to listen state emissions from blocs.
///
/// This is a quick fix to be able to detect initial state
/// on unit testing
///
/// See https://github.com/felangel/bloc/issues/1518
mixin BehaviorSubjectBloc<TEvent, TState> on Bloc<TEvent, TState> {
  @override
  StreamSubscription<TState> listen(
    void Function(TState state) onData, {
    Function onError,
    void Function() onDone,
    bool cancelOnError,
  }) {
    onData(state);
    return super.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
