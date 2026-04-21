
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

void showInstructionsBottomSheet (
  BuildContext context,
  String instructions){
    showModalBottomSheet(
      context: context, 
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_){
        final textTheme = Theme.of(context).textTheme;
        return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(1.wp),
            child: Column(
              children: [
                 Text(
                      context.l10n.instructionsTitle,
                      style: textTheme.titleMedium,
                    ),
                SizedBox(height: 1.hp),
                Text(instructions, 
                  style: textTheme.bodyMedium) ,
              ],
            ),
          )
        );
      });
  }
