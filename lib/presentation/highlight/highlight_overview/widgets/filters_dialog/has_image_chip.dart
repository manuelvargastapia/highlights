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
          selected: state.filters.showOnlyIfHasImage,
          label: const Text('With Image'),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          avatar: const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Icon(
              Icons.image,
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          selectedColor: Theme.of(context).accentColor,
          showCheckmark: false,
          onSelected: (_) {
            context
                .read<HighlightFiltererBloc>()
                .add(const HighlightFiltererEvent.showOnlyIfHasImageToggled());
          },
        );
      },
    );
  }
}
