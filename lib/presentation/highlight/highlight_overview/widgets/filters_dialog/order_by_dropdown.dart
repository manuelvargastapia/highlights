import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';

class OrderByDropdown extends StatelessWidget {
  const OrderByDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return DropdownButton<OrderByOption>(
          value: state.filters.orderByOption,
          onChanged: (orderBy) {
            context
                .read<HighlightFiltererBloc>()
                .add(HighlightFiltererEvent.orderByOptionChanged(orderBy));
          },
          items: OrderByOption.asList
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(
                    option.when(
                      orderByBookTitle: () => 'Order by title',
                      orderByDate: () => 'Order by date',
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
