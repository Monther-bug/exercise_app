import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_images.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_stat_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

class FavoritesBuilder extends StatelessWidget {
  final List<ExerciseEntity> list;
  final bool? favorite;
  const FavoritesBuilder({
    super.key,
    required this.list,
    this.favorite = true});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = context.l10n;
    return  ListView.builder(
      itemCount: list.length,
      itemBuilder:(context, index) {
         final exercise = list[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16)
              ,boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),]
            ),
            child: Padding(
              padding:  EdgeInsets.all(context.isMobile?5.wp: 2.wp),
              child: ListTile(
                subtitle: Text(exercise.type,
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.secondary,
                  fontSize: 12
                ),),
                title: Text(exercise.name,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 16
                ),
                softWrap: true,),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                       bool isFav = false;
                       if (state is FavoritesLoaded) {
                         isFav = state.exercise.any((e) => e.name == exercise.name);
                       }
                       return  IconButton(
                           onPressed: () {
                             context.read<FavoritesBloc>().add(ToggleFavorites(exercise: exercise));
                           },
                           icon: Icon(
                             isFav ? Icons.favorite : Icons.favorite_border,
                             color: isFav ? AppColors.accentMagenta : colorScheme.background,
                             size: 24,
                           ),
                         );
                       }),
                       SizedBox(width: 1.wp,),
                       Container(
                        decoration: BoxDecoration(
                                color: colorScheme.primary.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                         child: IconButton(onPressed: (){ context.pushRoute(ExerciseDetailsRoute(exerciseOBG: exercise));}, 
                         icon: Icon(Icons.arrow_forward_ios_outlined,
                         color: colorScheme.primary,
                         size: 22,)),
                       )                
                  ],
                ),
              ),
            ),
          
          ),
        );
      },);
  }
}