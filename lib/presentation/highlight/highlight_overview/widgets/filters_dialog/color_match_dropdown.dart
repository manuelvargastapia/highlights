import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/presentation/core/widgets/dropdown_popup_menu.dart';

class ColorMatchDropdown extends StatelessWidget {
  const ColorMatchDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return DropdownPopupMenu<Option<Color>>(
          itemBuilder: (context) => [
            DropdownPopupMenuItem<Option<Color>>(
              value: none(),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Icon(
                  Icons.block_flipped,
                  size: 38,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            ...HighlightColor.predefinedColors
                .map(
                  (color) => DropdownPopupMenuItem<Option<Color>>(
                    value: some(color),
                    child: Material(
                      color: color,
                      elevation: 4,
                      shape: CircleBorder(
                        side: state.filters.colorMatchOption.fold(
                          () => BorderSide.none,
                          (highlightColor) =>
                              highlightColor.getOrCrash() == color
                                  ? BorderSide(
                                      width: 2,
                                      color: Theme.of(context).backgroundColor,
                                    )
                                  : BorderSide.none,
                        ),
                      ),
                      child: const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
          onSelected: (colorOption) {
            context
                .read<HighlightFiltererBloc>()
                .add(HighlightFiltererEvent.filterByColorMatch(colorOption));
          },
          iconColor: Theme.of(context).backgroundColor,
          isHorizontal: true,
          child: state.filters.colorMatchOption.fold(
            () => Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(
                  Icons.block_flipped,
                  size: 32,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            (highlightColor) => Material(
              color: highlightColor.getOrCrash(),
              shape: CircleBorder(
                side: BorderSide(
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              child: const SizedBox(
                width: 30,
                height: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
