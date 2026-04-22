
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_images.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_stat_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

class BuildListWidget extends StatelessWidget {
  final List<ExerciseEntity> list;
  final bool? favorite;

  const BuildListWidget({
    super.key,
    required this.list,
    this.favorite = true,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = context.l10n;

    return ListView.builder(
      itemCount: list.length,
      padding: EdgeInsets.symmetric(horizontal: 4.wp, vertical: 2.hp),
      itemBuilder: (context, index) {
        final exercise = list[index];

        return Container(
          margin: EdgeInsets.only(bottom: 3.hp),
          decoration: BoxDecoration(
            color: colorScheme.surface, // #F2EFFF
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. IMAGE SECTION WITH FAVORITE BUTTON
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                    child: Image.asset(
                      // Replace with exercise.imageUrl if available in your entity
                      AppImages.home, 
                      height: context.isMobile?22.hp: 40.hp,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // FAVORITE BUTTON
                  Positioned(
                    top: 15,
                    right: 15,
                    child: BlocBuilder<FavoritesBloc, FavoritesState>(
                      builder: (context, state) {
                        bool isFav = false;
                        if (state is FavoritesLoaded) {
                          isFav = state.exercise.any((e) => e.name == exercise.name);
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.read<FavoritesBloc>().add(ToggleFavorites(exercise: exercise));
                            },
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? colorScheme.primary : colorScheme.background,
                              size: 24,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // DIFFICULTY TAG (e.g., PRO LEVEL)
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.accentMagenta.withOpacity(0.8), // accentMagenta
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        exercise.difficulty.toUpperCase(),                        
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 2. DETAILS SECTION
              Padding(
                padding: EdgeInsets.all(5.wp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.muscle.toUpperCase(),
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.primary, // #3E65FF
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exercise.name,
                      style: textTheme.titleLarge?.copyWith(                      
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        
                        BuildStatIcon(
                          textTheme: textTheme, 
                          icon: Icons.access_time_filled, 
                          label: l10n.defaultDuration, 
                          color: colorScheme.shadow.withOpacity(0.7)),
                       
                        const SizedBox(width: 16),
                        BuildStatIcon(
                          textTheme: textTheme, 
                          icon: Icons.bolt, 
                          label:  l10n.defaultCalories, 
                          color: colorScheme.shadow.withOpacity(0.7)),
                       
                        const Spacer(),
                        // VIEW DETAILS BUTTON
                        ElevatedButton(
                          onPressed: () {
                            context.pushRoute(ExerciseDetailsRoute(exerciseOBG: exercise));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.secondary.withOpacity(0.4), // Light purple background
                            foregroundColor: colorScheme.primary,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            l10n.viewDetails,
                            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  
}