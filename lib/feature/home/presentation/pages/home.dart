import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/presentation/bloc/local_bloc.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/error/presentation/empty_view.dart';
import 'package:exercise_app/feature/error/presentation/global_error_view.dart';
import 'package:exercise_app/feature/home/data/model/request/exercise_request.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/bloc/exercise_bloc.dart';
import 'package:exercise_app/feature/home/bloc/search_bloc.dart';
import 'package:exercise_app/feature/home/presentation/widgets/build_list_widget.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, @PathParam("title") required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 1. You need an actual instance here
  List<ExerciseEntity> exercise = [];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
      child: GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);          
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {        
        FocusManager.instance.primaryFocus?.unfocus();
      }},
        child: Center(
          child: SizedBox(
            width: context.isMobile ? 100.wp : 75.wp,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 10.hp,
                // title: Padding(padding: EdgeInsets.all(1.wp), child:
                // SearchBar(
        
                // )),
                title: Customtextfeild(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorScheme.primary,
                    size: context.isMobile ? 5.wp : 2.wp,
                  ),
                  hintText: context.l10n.searchHint,
                  onChanged: (value) {
                    context.read<SearchBloc>().add(SearchingEvent(EcerciseRequest(name: value)));
                  },
                  onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                  borderRadius: 1.wp,
                ),
                actions: [
                  //   IconButton(
                  // onPressed: (){context.read<AuthBloc>().add(LogoutRequested());},
                  // icon: Icon(
                  //   Icons.login_outlined,
                  //   //context.isMobile? 4.wp: 2.wp,
                  //   size: context.isMobile? 5.wp: 2.wp,
                  //   color: colorScheme.primary,
                  // )),
                  BlocBuilder<LocalBloc, LocalState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          context.read<LocalBloc>().add(TehmeToggle());
                        },
                        icon: Icon(state.themeMode == ThemeMode.dark
                          ? Icons.light_mode
                          :Icons.dark_mode,
                          size: context.isMobile ? 5.wp : 2.wp,
                          color: colorScheme.primary,),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      final currentState = context.read<LocalBloc>().state;
                      final newState = currentState.locale.languageCode == 'en'
                          ? const Locale('ar')
                          : const Locale('en');
                      context.read<LocalBloc>().add(ChangeLanguage(newState));
                    },
                    icon: Icon(
                      Icons.language,
                      size: context.isMobile ? 5.wp : 2.wp,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<SearchBloc, SearchState>(
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
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
