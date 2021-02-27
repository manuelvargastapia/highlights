import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/quote_field.dart';

class HighlightFormScaffold extends StatelessWidget {
  /// This property must be `static` to avoid build loop
  ///
  /// See https://github.com/flutter/flutter/issues/20042
  static final _formKey = GlobalKey<FormState>();

  const HighlightFormScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HighlightFormBloc, HighlightFormState>(
          buildWhen: (prev, curr) => prev.isEditing != curr.isEditing,
          builder: (context, state) {
            return Text(
              state.isEditing ? 'Edit a Highlight' : 'Create a Highlight',
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _formKey.currentState.validate();

              context
                  .read<HighlightFormBloc>()
                  .add(const HighlightFormEvent.saved());
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: BlocBuilder<HighlightFormBloc, HighlightFormState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const QuoteField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
