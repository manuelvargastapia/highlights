import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/domain/highlights/value_objects.dart';

class ColorField extends StatelessWidget {
  const ColorField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightFormBloc, HighlightFormState>(
      buildWhen: (prev, curr) => prev.highlight.color != curr.highlight.color,
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: HighlightColor.predefinedColors.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemBuilder: (context, index) {
              final itemColor = HighlightColor.predefinedColors[index];

              return GestureDetector(
                onTap: () {
                  context
                      .read<HighlightFormBloc>()
                      .add(HighlightFormEvent.colorChange(itemColor));
                },
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  shape: CircleBorder(
                    side: state.highlight.color.value.fold(
                      // Currently, can't be any errors in this point,
                      // but we can handle them here in case is needed
                      (_) => BorderSide.none,
                      (color) => color == itemColor
                          ? const BorderSide(width: 1.5)
                          : BorderSide.none,
                    ),
                  ),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
