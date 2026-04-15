import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/error/presentation/empty_view.dart';
import 'package:exercise_app/feature/error/presentation/global_error_view.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/presentation/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/home/presentation/bloc/search_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_list_widget.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
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
    return BlocListener<ExerciseBloc, ExerciseState>(
      listener: (context, state) {
         if (state is ExerciseError) {
          String message = state.error;
          context.pushRoute(GlobalErrorViewRoute(message: message));
        }  
        if (state is ExerciseEmpty) {
        context.pushRoute(EmptyViewRoute());
        }
      },
       child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          toolbarHeight: 10.hp,
          // title: Padding(padding: EdgeInsets.all(1.wp), child: 
          // SearchBar(
           
          // )),
          title: Customtextfeild(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              prefixIcon:  Icon(
                Icons.search, 
                color: AppColors.primary,
                size: context.isMobile? 4.wp:2.wp),
              hintText: 'Search',
              onChanged: (value){
                context.read<SearchBloc>().add(SearchingEvent(value));
              },
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
              borderRadius: 1,
            ),
          leading: IconButton(
            onPressed: (){context.read<AuthBloc>().add(LogoutRequested());}, 
            icon: Icon(
              Icons.login_outlined,
              size: context.isMobile? 4.wp: 2.wp,
              color: AppColors.primary,
            )),
        ),
        body: 
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Searchfailed) {
              return GlobalErrorView(message: state.message);
            } else if (state is SearchEmpty) {
              return EmptyView();
            } else if (state is SearchSuccessful) {
              final list = state.data;
              return BuildListWidget(list: list);              
            }
          
            return BlocBuilder<ExerciseBloc, ExerciseState>(
              builder: (context, state) {
                if (state is ExerciseLoaded) {
                  var list = state.exercises;
                  return BuildListWidget(list: list);
                }                
                return Center(child: CircularProgressIndicator());
              },
            );
          }
       )
       )
    );
  }
}

