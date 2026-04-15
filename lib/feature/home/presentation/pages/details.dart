import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_images.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/instructions_bottom_sheet.dart';
import 'package:exercise_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

@RoutePage()
class ExerciseDetails extends StatelessWidget {
  final ExerciseEntity exerciseOBG;
  const ExerciseDetails({
    super.key,
    required this.exerciseOBG});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(        
        leading: IconButton(
          onPressed: (){
            appRouter.pop();
          }, 
          icon: Icon(
            Icons.arrow_back_ios,
            size: context.isMobile? 4.wp: 2.wp,
            color: AppColors.primary,
          )),
        title: Text('Exercise Details',
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.primary
          )      
        ),          
      ),
      body: Center(
        child: SizedBox( width: context.isMobile? 100.wp: 50.wp,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16), // 👈 clean radius
                    child: Image.asset(
                      AppImages.exercise,
                      width: context.isMobile ? 60.wp : 30.wp,
                    ),
                  ),

                  SizedBox(height: 2.hp),

                  Text(
                    exerciseOBG.name,
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 0.5.hp),

                  Text(
                    '${exerciseOBG.type} training',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
              
                  SizedBox(height: 5.hp,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.neutural,
                              boxShadow: [BoxShadow(
                                color: AppColors.shadow.withOpacity(0.3),
                                blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(2, 2),
                                        
                              )],
                              borderRadius: BorderRadius.circular(context.isMobile?3.wp: 2.wp )
                          
                            ),
                            child:Padding(
                              padding:  EdgeInsets.all(context.isMobile?2.wp: 1.wp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Difficulty',
                                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary)),
                                Text(exerciseOBG.difficulty,
                                style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
                                )                        
                              ],),
                            ), 
                          ),
                        ),
                        SizedBox(width: 1.wp,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.neutural,
                              boxShadow: [BoxShadow(
                                color: AppColors.shadow.withOpacity(0.3),
                                blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(2, 2),
                                        
                              )],borderRadius: BorderRadius.circular(context.isMobile?3.wp: 2.wp)
                          
                            ),
                            child:Padding(
                              padding:  EdgeInsets.all(context.isMobile?2.wp: 1.wp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Muscle',
                                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary)),
                                Text(exerciseOBG.muscle,
                                style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
                                )                        
                              ],),
                            ), 
                          ),
                        )
                      ],),
                      SizedBox(height: 5.hp),

                      Row(children: [
                        Icon(Icons.handyman,
                        size: context.isMobile?5.wp:2.wp,
                        color: AppColors.primary),

                        SizedBox(width: 1.wp),

                        Text('Equipments',
                        style: AppTextStyles.titleLarge.copyWith(color: AppColors.primary))                      
                      ],),
                      
                      SizedBox(height: 1.hp),
                             
                      
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: exerciseOBG.equipments.map((e) {
                            return Chip(
                              label: Text(e),
                              avatar: Icon(Icons.fitness_center, size: 16),
                              backgroundColor: AppColors.neutural,
                            );
                          }).toList(),
                        ),
                      ),
                        SizedBox(height: 5.hp),

                      

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showInstructionsBottomSheet(context, exerciseOBG.instructions);
                          },
                          icon: Icon(Icons.menu_book),
                          label: Text("View Instructions"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.neutural,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      )

                     
  


              ],),
            ),
          ),
        ),
      )
    );
  }
}