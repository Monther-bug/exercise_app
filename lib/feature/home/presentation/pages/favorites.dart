import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_list_widget.dart';
import 'package:exercise_app/feature/home/presentation/widgets/favorites_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';


@RoutePage()

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(              
        title: Text(context.l10n.favoritesTitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14
          )      
        ),          
      ),

      body: Center(
        child: SizedBox(
          width: context.isMobile?100.wp: 75.wp,
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state){
              if(state is FavoritesLoaded){
                var list = state.exercise;
                if(list.isNotEmpty){
                  return FavoritesBuilder(
                  list: list,
                  favorite: false,);
                }           
                else{
                  return Center(child : Text(context.l10n.noFavoritesYet));
                } 
              }
              return Center(child: CircularProgressIndicator());
            }),
        ),
      )
    );
  }
}
