import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/color_match_dropdown.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/descending_order_chip.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/has_image_chip.dart';
import 'package:highlights/presentation/highlight/highlight_overview/widgets/filters_dialog/order_by_dropdown.dart';

class FiltersBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HighlightFiltererBloc, HighlightFiltererState>(
      listener: (context, state) {
        context
            .read<HighlightWatcherBloc>()
            .add(HighlightWatcherEvent.watchFilteredStarted(state.filters));
      },
      builder: (_, __) {
        return SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: const [
              OrderByDropdown(),
              SizedBox(width: 16),
              DescendingOrderChip(),
              SizedBox(width: 8),
              ColorMatchDropdown(),
              SizedBox(width: 8),
              HasImageChip(),
            ],
          ),
        );
      },
    );
  }
}
