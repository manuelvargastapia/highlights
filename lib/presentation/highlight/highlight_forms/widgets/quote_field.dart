import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:highlights/domain/highlights/value_objects.dart';
import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/core/widgets/flush_bar_helper.dart';

class QuoteField extends HookWidget {
  const QuoteField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<HighlightFormBloc, HighlightFormState>(
      // To avoid getting an unrecoverable error on runtiem, listen to
      // state changes only when editing the Highlight or when the quote
      // changes due to text recognition
      listenWhen: (prev, curr) =>
          prev.isEditing != curr.isEditing ||
          prev.quoteExtractedFromImage != curr.quoteExtractedFromImage,

      listener: (context, state) {
        textEditingController.text = state.highlight.quote.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.format_quote,
                      color: Theme.of(context).backgroundColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Quote',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.copy,
                        color: Theme.of(context).backgroundColor,
                      ),
                      onPressed: () async {
                        await Clipboard.setData(
                          ClipboardData(text: textEditingController.text),
                        );
                        FlushbarHelper.createInformation(
                          context: context,
                          message: 'Quote text copied to clipboard',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).backgroundColor,
                      ),
                      onPressed: () {
                        textEditingController.clear();
                        context
                            .read<HighlightFormBloc>()
                            .add(const HighlightFormEvent.quoteChange(''));
                      },
                    )
                  ],
                ),
              ],
            ),
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(16),
              ),
              textAlign: TextAlign.justify,
              maxLength: HighlightQuote.maxLength,
              maxLines: 10,
              minLines: 10,
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
          ],
        ),
      ),
    );
  }
}
