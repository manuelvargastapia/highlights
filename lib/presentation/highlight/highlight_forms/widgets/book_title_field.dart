import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/core/widgets/core_text_form_field.dart';

class BookTitleField extends HookWidget {
  const BookTitleField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<HighlightFormBloc, HighlightFormState>(
      listenWhen: (prev, curr) => prev.isEditing != curr.isEditing,
      listener: (context, state) {
        textEditingController.text = state.highlight.bookTitle.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 8),
        child: CoreTextFormField(
          controller: textEditingController,
          labelText: 'Book Title',
          prefixIcon: const Icon(Icons.book),
          maxLength: BookTitle.maxLength,
          onChanged: (value) {
            context
                .read<HighlightFormBloc>()
                .add(HighlightFormEvent.bookTitleChanged(value));
          },

          // Use state directly from bloc because latter is delayed
          // (it'll validate the previous state instead of the current
          // text inputed)
          validator: (_) => context
              .read<HighlightFormBloc>()
              .state
              .highlight
              .bookTitle
              .value
              .fold(
                (failure) => failure.maybeMap(
                  empty: (_) => 'Required',
                  // We don't want to forget this case, but it won't happen
                  // if we set maxLength: HighlightQuote.maxLength
                  exceedingLength: (f) => 'Exceeding length. Max: ${f.max}',
                  orElse: () => null,
                ),
                // If validator returns null, then any feedback is
                // provided to user because everithing is right
                (_) => null,
              ),
        ),
      ),
    );
  }
}
