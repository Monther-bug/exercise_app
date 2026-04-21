import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/home/presentation/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(              
        title: Text(context.l10n.favoritesTitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary
          )      
        ),          
      ),

      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state){
          if(state is FavoritesLoaded){
            var list = state.exercise;
            if(list.isNotEmpty){
              return BuildListWidget(
              list: list,
              favorite: false,);
            }           
            else{
              return Center(child : Text(context.l10n.noFavoritesYet));
            } 
          }
          return Center(child: CircularProgressIndicator());
        })
    );
  }
}
