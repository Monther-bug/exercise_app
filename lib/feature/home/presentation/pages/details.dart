import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/theme/app_images.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/instructions_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

@RoutePage()
class ExerciseDetails extends StatelessWidget {
  final ExerciseEntity exerciseOBG;
  const ExerciseDetails({
    super.key,
    required this.exerciseOBG});

  @override
  Widget build(BuildContext context) {    
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Scaffold(
  backgroundColor: colorScheme.background, // Your light surface color
  body: Center(
    child: SizedBox(
      width: context.isMobile? 100.wp: 50.wp,
      child: CustomScrollView(
        slivers: [
          // 1. THE HERO SECTION (Image + Title)
          SliverAppBar(
            expandedHeight: 400,
            backgroundColor: const Color(0xFF020617),
            pinned: true, // Keeps a small bar at the top when scrolling
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Your Background Image
                  Positioned.fill(
                    child: Image.asset(AppImages.details, fit: BoxFit.cover),
                  ),
                  // The Gradient we discussed to blend it
                   Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [colorScheme.surfaceVariant.withOpacity(0.5),colorScheme.background],
                          stops: [0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // The "BACK SQUAT" text
                  Positioned(
                    bottom: 60,
                    left: 20,
                    right: 20,
                    child: Text(exerciseOBG.name.toUpperCase(), style:  textTheme.titleLarge?.copyWith(
                    fontSize:  40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,),
                  ),
                ],
              ),
            ),
          ),
      
          // 2. THE CONTENT (White Card & Beyond)
          SliverToBoxAdapter(
          
            child: Padding(
              padding:  EdgeInsets.only(top: 5.wp, left: 5.wp, right: 5.wp),
              child: Column(
                children: [
                  Container(
                    decoration:  BoxDecoration(
                      //Color(0xFFF2EFFF),
                    //color: colorScheme.surface,
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(
                        top: 4.wp, 
                        left: 4.wp, 
                        right: 4.wp, 
                        bottom: 4.wp // Increased bottom padding inside the container
                      ),
                        child: Column(
                        children: [
                          // Place this inside the Column of your white Container
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            // 1. THE SUBTITLE
                               Text(
                                l10n.targetedMuscleGroup,
                                style: textTheme.titleSmall?.copyWith(
                                color:colorScheme.primary, // Your primaryBlue
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                               ),
                              const SizedBox(height: 16),
                          
                               // 2. THE MAIN MUSCLE ROW
                              Row(
                                children: [
                                // The Light Blue Icon Box
                                Container(
                                  height: 70,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDCE7FF), // Very light version of your blue
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:  Icon(
                                    Icons.accessibility_new, // Or a custom body SVG
                                    color: colorScheme.primary,
                                    size: 35,
                                  ),
                                ),
                                const SizedBox(width: 20),
                      
                                // The Muscle Name and Supporting Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exerciseOBG.muscle.toUpperCase(),
                                        style: textTheme.titleLarge?.copyWith(
                                          fontSize: context.isMobile? 24: 28,
                                          fontWeight: FontWeight.w900,
                                         // color: const Color(0xFF1E293B), // Deep slate for readability
                                        ),
                                      ),
                                      Text(
                                        l10n.supportingMuscles,
                                        style:  textTheme.titleMedium?.copyWith(
                                          color: const Color(0xFF64748B), // Muted grey text
                                        ),
                                      ),
                  
                                      
                                    ],
                                  ),
                                ),
                              ]),
                              SizedBox(height: 2.hp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: colorScheme.background,
                                              borderRadius: BorderRadius.circular(12)
                                            ),
                                            child: Padding(                                        
                                              padding:  EdgeInsets.all(2.5.wp),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                Text(l10n.typeLabel.toUpperCase(),
                                                style: textTheme.bodySmall,),
                                                Text(exerciseOBG.type.toUpperCase(),
                                                style: textTheme.titleMedium?.copyWith(
                                                  fontWeight: FontWeight.w700
                                                ))
                                              ],),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.wp,),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: colorScheme.background,
                                              borderRadius: BorderRadius.circular(12)
                                            ),
                                            child: Padding(                                        
                                              padding:  EdgeInsets.all(2.5.wp),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                Text(l10n.difficultyLabel.toUpperCase(),
                                                style: textTheme.bodySmall,),
                                                Text(exerciseOBG.difficulty.toUpperCase(),
                                                style: textTheme.titleMedium?.copyWith(
                                                  fontWeight: FontWeight.w700
                                                ))
                                              ],),
                                            ),
                                          ),
                                        )
                                      ],)
                          ]),
                        ),   // The Step-by-Step list
                      ]),
                    ),
                  ),
                  SizedBox(height: 2.hp,),
                  Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6D6BD4), // Your new purple-blue color
                    borderRadius: BorderRadius.circular(32), // Large rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. HEADER
                      Text(
                        l10n.equipmentsLabel.toUpperCase(),
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSecondary.withOpacity(0.9),
                          letterSpacing: 1.5,
                        )
                         
                      ),
                      const SizedBox(height: 20),

                      // 2. DYNAMIC LIST FROM API
                      // We map the equipment list to a Column of Rows instead of a Wrap of Chips
                      ...exerciseOBG.equipments.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              // Icon Container
                              Icon(
                                Icons.fitness_center, // You can switch this based on 'item' name if needed
                                color: Colors.white.withOpacity(0.8),
                                size: 20,
                              ),
                              const SizedBox(width: 15),
                              // Equipment Name
                              Text(
                                item.toUpperCase(),
                                style: textTheme.titleMedium?.copyWith(
                                   fontSize: context.isMobile? 12: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.1,
                                    color: colorScheme.onSecondary
                                )
                                
                              ),
                            ],
                          ),
                        );
                      }).toList(),

                      // 3. OPTIONAL DIVIDER & FOOTER NOTE
                      Divider(color:colorScheme.onSecondary.withOpacity(0.2), height: 30),
                      Text(
                        l10n.equipmentSubstituteNote,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                          color:colorScheme.onSecondary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 2.hp),

                Padding(
                    padding: const EdgeInsets.symmetric( vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Takes only as much space as needed
                      children: [
                        // 1. VIEW INSTRUCTIONS BUTTON
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:colorScheme.shadow.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],),
                          
                          child: ElevatedButton(
                            onPressed: () {
                              showInstructionsBottomSheet(context, exerciseOBG.instructions);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary, // Your Royal Blue
                              foregroundColor: colorScheme.onSecondary,
                              shape: const StadiumBorder(), // Perfectly rounded edges
                              elevation: 0, // Handled by Container for better control
                            ),
                            child: Text(
                              l10n.viewInstructions.toUpperCase(),
                              style: textTheme.titleMedium?.copyWith(
                                fontSize: context.isMobile? 12: 16,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.2,
                                color: colorScheme.onSecondary
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 2. ADD TO FAVORITES BUTTON
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                               context.read<FavoritesBloc>().add(ToggleFavorites(exercise:exerciseOBG));                             
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  colorScheme.surface, // Your light lavender
                              foregroundColor: colorScheme.primary, // Blue text
                              shape: const StadiumBorder(),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite, size: 20),
                                const SizedBox(width: 10),
                                Text(
                                  l10n.addToFavorites,
                                  style: textTheme.titleMedium?.copyWith(
                                    fontSize: context.isMobile? 12: 16,                                    
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.2,
                                    color: colorScheme.primary
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          
                
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
    
  }
}
