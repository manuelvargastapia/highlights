import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/application/highlight/highlight_form/highlight_form_bloc.dart';
import 'package:highlights/domain/highlights/highlight.dart';
import 'package:highlights/injection.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/highlight_form_scaffold.dart';
import 'package:highlights/presentation/highlight/highlight_forms/widgets/saving_in_progress_overlay.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

class HighlightFormPage extends StatelessWidget {
  final Highlight editedHighlight;

  const HighlightFormPage({
    Key key,
    this.editedHighlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HighlightFormBloc>()
        ..add(
          HighlightFormEvent.initialized(optionOf(editedHighlight)),
        ),
      child: BlocConsumer<HighlightFormBloc, HighlightFormState>(
        listenWhen: (prev, curr) =>
            prev.saveFailureOrSuccessOption != curr.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            // Don't do anything if it's none()
            () {},
            (failureOrUnit) => failureOrUnit.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.maybeMap(
                    insufficientPermission: (_) => 'Insufficient permissions ❌',
                    unableToUpdate: (_) =>
                        "Couldn't update the note. Was it deleted from another device?",
                    orElse: () =>
                        'Unexpected error 😨 Please, contact support.',
                  ),
                ).show(context);
              },
              (_) {
                // Pop until we reach HighlightOverviewPage because FlushBar is
                // itself a route, so a simple pop() wouldn't necessarily take
                // us to the desired page
                ExtendedNavigator.of(context).popUntil(
                  (route) =>
                      route.settings.name == Routes.highlightOverviewPage,
                );
              },
            ),
          );
        },
        buildWhen: (prev, curr) => prev.isSaving != curr.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              const HighlightFormScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          );
        },
      ),
    );
  }
}
