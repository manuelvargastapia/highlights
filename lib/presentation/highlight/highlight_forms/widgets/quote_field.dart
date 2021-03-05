import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';

class QuoteField extends HookWidget {
  const QuoteField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<HighlightFormBloc, HighlightFormState>(
      // To avoid getting an unrecoverable error on runtiem, listen to
      // state changes only when editing the Highlight or when the quote
      // changes
      listenWhen: (prev, curr) =>
          prev.isEditing != curr.isEditing ||
          prev.highlight.quote.highlightQuote !=
              curr.highlight.quote.highlightQuote,

      // Update text property with current quote in state only if it doesn't
      // carry a failure. Also, update the cursos position to put it at the end
      // of the text
      listener: (context, state) {
        if (state.highlight.quote.failureOption.isNone()) {
          final quote = state.highlight.quote.highlightQuote.getOrCrash();
          textEditingController.text = quote;
          textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: quote.length),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Quote',
            counterText: '', // Don't show counter text
          ),
          maxLength: HighlightQuote.maxLength,
          maxLines: null, // Remove restriction to expand dynamically
          minLines: 5,
          onChanged: (value) {
            context
                .read<HighlightFormBloc>()
                .add(HighlightFormEvent.quoteChange(value));
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,

          // Use state directly from bloc because latter is delayed
          // (it'll validate the previous state instead of the current
          // text inputed)
          validator: (_) => context
              .read<HighlightFormBloc>()
              .state
              .highlight
              .quote
              .highlightQuote
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
