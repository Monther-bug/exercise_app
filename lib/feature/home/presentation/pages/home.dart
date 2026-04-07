import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/api_client.dart';
import 'package:exercise_app/core/network/network_failure.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/feature/error/presentation/global_error_view.dart';
import 'package:exercise_app/feature/home/data/repositories/exercise_repository.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. You need an actual instance here
  List<ExerciseEntity> exercise = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        // actions: [IconButton(onPressed: (){
        //   context.read<ExerciseBloc>().add(DisplayExercise());}
        //   , icon:Icon(Icons.list))],
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {        
         
          
          if(state is ExerciseLoaded){
            var list = state.exercises;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(list[index].name,style: AppTextStyles.titleMedium,),
                      subtitle: Text(list[index].muscle, style: AppTextStyles.bodyMedium),
                    ),
                  ),
                ),
              ),
            );
          }    
          else if(state is ExerciseError){
            String message = state.error;
            context.pushRoute(GlobalErrorViewRoute(message: message));
          }      
          else if(state is ExerciseEmpty){
            context.pushRoute(EmptyViewRoute());
          }
          return Center(child: CircularProgressIndicator(),);
        },
        
        
      ),
    );
  }
}
