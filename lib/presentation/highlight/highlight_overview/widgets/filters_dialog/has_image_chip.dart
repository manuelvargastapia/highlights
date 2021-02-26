import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';

class HasImageChip extends StatelessWidget {
  const HasImageChip();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return FilterChip(
          selected:
              context.read<HighlightFiltererBloc>().state.filters.hasImage,
          label: const Text('Has image'),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.black54,
          selectedColor: Theme.of(context).accentColor,
          checkmarkColor: Colors.white,
          onSelected: (_) {
            context
                .read<HighlightFiltererBloc>()
                .add(const HighlightFiltererEvent.hasImageToggled());
          },
        );
      },
    );
  }
}
