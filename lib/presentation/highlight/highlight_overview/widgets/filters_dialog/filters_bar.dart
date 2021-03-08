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
      builder: (context, state) {
        return Wrap(
          spacing: 16,
          children: const [
            HasImageChip(),
            ColorMatchDropdown(),
            OrderByDropdown(),
            DescendingOrderChip(),
          ],
        );
      },
    );
  }
}
