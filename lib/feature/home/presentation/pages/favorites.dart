import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/presentation/bloc/favorites_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_list_widget.dart';
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
        // leading: IconButton(
        //   onPressed: (){
        //     context.popRoute();
        //   }, 
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: context.isMobile? 4.wp: 2.wp,
        //     color: AppColors.primary,
        //   )),
        title: Text(' Favorites',
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.primary
          )      
        ),          
      ),

      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state){
          if(state is FavoritesLoaded){
            var list = state.exercise;
            return BuildListWidget(
              list: list,
              favorite: false,);
          }
          return Center(child: CircularProgressIndicator());
        })
    );
  }
}