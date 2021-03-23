import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';

// TODO: refactor to use hooks
class DescendingOrderChip extends StatefulWidget {
  const DescendingOrderChip();
  @override
  _DescendingOrderChipState createState() => _DescendingOrderChipState();
}

class _DescendingOrderChipState extends State<DescendingOrderChip>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _rotation = Tween<double>(begin: 0, end: 180).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeInExpo,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return FilterChip(
          selected: state.filters.descendingOrder,
          label: AnimatedSize(
            duration: _controller.duration ~/ 2,
            vsync: this,
            curve: Curves.fastOutSlowIn,
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: _rotation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: radians(_rotation.value),
                      child: child,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Theme.of(context).accentColor,
          selectedColor: Theme.of(context).accentColor,
          showCheckmark: false,
          onSelected: (_) {
            if (state.filters.descendingOrder) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            context
                .read<HighlightFiltererBloc>()
                .add(const HighlightFiltererEvent.descendingOrderToggled());
          },
        );
      },
    );
  }
}
