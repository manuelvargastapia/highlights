import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_filterer/highlight_filterer_bloc.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

class ColorMatchDropdown extends StatelessWidget {
  const ColorMatchDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFiltererBloc, HighlightFiltererState>(
      builder: (context, state) {
        return DropdownButton<Option<Color>>(
          value: state.filters.colorMatchOption.fold(
            () => none(),
            (highlightColor) => some(highlightColor.getOrCrash()),
          ),
          onChanged: (colorOption) {
            context
                .read<HighlightFiltererBloc>()
                .add(HighlightFiltererEvent.filterByColorMatch(colorOption));
          },
          items: [
            DropdownMenuItem(
              value: none(),
              child: const SizedBox(
                height: 20,
                width: 40,
                child: Center(child: Text('Color')),
              ),
            ),
            ...HighlightColor.predefinedColors
                .map(
                  (color) => DropdownMenuItem(
                    value: some(color),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: color,
                        ),
                        height: 30,
                        width: 40,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        );
      },
    );
  }
}
