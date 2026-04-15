import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/presentation/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

class BuildListWidget extends StatelessWidget {
  final List<ExerciseEntity> list;
  final bool? favorite ;
  const BuildListWidget({
    super.key, 
    required this.list,
    this.favorite = true});

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(1.wp),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.neutural,
            borderRadius: BorderRadius.circular(2.wp),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(1.wp),
            child: ListTile(
              title: Text(list[index].name, style: AppTextStyles.titleMedium),
              subtitle: Text(
                list[index].muscle,
                style: AppTextStyles.bodyMedium,
              ),
              trailing: SizedBox(
                 //width: context.isMobile ? 10.wp : 5.wp,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(favorite?? true)
                    BlocBuilder<FavoritesBloc, FavoritesState>(                    
                      builder: (context, state) {  
                        bool isFav = false;
                        if(state is FavoritesLoaded){
                          isFav = state.exercise.any((e) => e.name == list[index].name);
                        }                                        
                        return IconButton(
                          onPressed: () {
                           context.read<FavoritesBloc>().add(ToggleFavorites(exercise: list[index]));                             
                          },
                          icon: Icon(isFav
                            ? Icons.favorite:
                            Icons.favorite_border_outlined,
                            size: context.isMobile ? 4.wp : 2.wp,
                            color: AppColors.primary,
                          )
                        );                        
                      },
                    ),
                
                    IconButton(
                      onPressed: () {
                        context.pushRoute(
                          ExerciseDetailsRoute(exerciseOBG: list[index]),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: context.isMobile ? 4.wp : 2.wp,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
