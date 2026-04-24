import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../Auth/presentation/bloc/auth_status_bloc/bloc/auth_status_bloc.dart';
import '../../bloc/favorites_bloc.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        if(state is Unauthenticated){
          appRouter.replaceAll([LoginScreenRoute()]);
          context.read<FavoritesBloc>().add(ClearFavorites());}
      },
      child: 
      AutoTabsScaffold(
        routes: [
          MyHomePageRoute(title: ''), // index 0
          FavoritesPageRoute(),
        ],
        bottomNavigationBuilder: (context, TabsRouter) {
          return Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: GNav(              
              selectedIndex: TabsRouter.activeIndex,
              onTabChange: TabsRouter.setActiveIndex,
              color: Theme.of(context).colorScheme.secondary,
              activeColor: Theme.of(context).colorScheme.surface,
              tabBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
              gap: 7,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              tabs: 
              [
                GButton(
                  icon: Icons.home_outlined,
                  text: context.l10n.homeTab,
                ),
                GButton(
                  icon: Icons.favorite_outline,
                  text: context.l10n.favoritesTab,
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
