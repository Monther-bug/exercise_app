import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.l10n.noDataFound),
      ),
    );
  }
}
