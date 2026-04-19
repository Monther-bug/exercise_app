

import 'package:exercise_app/core/theme/app_text_styles.dart';
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
        return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(1.wp),
            child: Column(
              children: [
                 Text(
                      context.l10n.instructionsTitle,
                      style: AppTextStyles.titleMedium,
                    ),
                SizedBox(height: 1.hp),
                Text(instructions, 
                  style: AppTextStyles.bodyMedium) ,
              ],
            ),
          )
        );
      });
  }
