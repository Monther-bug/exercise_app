import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class BuildListWidget extends StatelessWidget {
  final List<ExerciseEntity> list;
  const BuildListWidget({
    super.key,
    required this.list});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => 
      Padding(
        padding:  EdgeInsets.all(1.wp),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.neutural,
            borderRadius: BorderRadius.circular(2.wp),
            boxShadow: [BoxShadow(
              color: AppColors.shadow.withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(2, 2),
            )]      
          ),
          child: Padding(
            padding:  EdgeInsets.all(1.wp),
            child: ListTile(
              title: Text(list[index].name,style: AppTextStyles.titleMedium,),
              subtitle: Text(list[index].muscle, style: AppTextStyles.bodyMedium),
              trailing: IconButton(
                onPressed: (){
                  context.pushRoute(ExerciseDetailsRoute(exerciseOBG: list[index]));
                }, 
                icon: Icon(Icons.arrow_forward_ios,
                size: context.isMobile? 4.wp: 2.wp,
                color: AppColors.primary,),),
                         
            ),
          ),
        ),
      ),
    );
  }
}
