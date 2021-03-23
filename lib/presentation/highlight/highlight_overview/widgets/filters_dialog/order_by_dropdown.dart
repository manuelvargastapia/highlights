import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/domain/highlights/highlight_search_filter.dart';
import 'package:highlights/presentation/core/widgets/dropdown_popup_menu.dart';

class OrderByDropdown extends StatelessWidget {
  const OrderByDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).backgroundColor,
          ),
          child: DropdownPopupMenu<OrderByOption>(
            onSelected: (orderBy) => context
                .read<HighlightFiltererBloc>()
                .add(HighlightFiltererEvent.orderByOptionChanged(orderBy)),
            itemBuilder: (context) {
              return List<PopupMenuEntry<OrderByOption>>.generate(
                OrderByOption.asList.length,
                (index) {
                  return DropdownPopupMenuItem<OrderByOption>(
                    value: OrderByOption.asList[index],
                    child: Text(
                      OrderByOption.asList[index].when(
                        orderByBookTitle: () => 'Order by Title',
                        orderByDate: () => 'Order by Date',
                      ),
                    ),
                  );
                },
              );
            },
            iconColor: Colors.white,
            child: Text(
              state.filters.orderByOption.when(
                orderByBookTitle: () => 'Order by Title',
                orderByDate: () => 'Order by Date',
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
