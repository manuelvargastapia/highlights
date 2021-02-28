import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Book title',
            counterText: '', // Don't show counter text
          ),
          maxLength: BookTitle.maxLength,
          onChanged: (value) {
            context
                .read<HighlightFormBloc>()
                .add(HighlightFormEvent.bookTitleChanged(value));
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,

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
                  empty: (_) => 'Cannot be empty',
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
