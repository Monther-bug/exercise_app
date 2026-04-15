import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  AutoTabsScaffold(
      routes: [
        MyHomePageRoute(title: ''), // index 0
        FavoritesPageRoute(),        
      ],
      bottomNavigationBuilder: (_, TabsRouter){
        return BottomNavigationBar(
          currentIndex: TabsRouter.activeIndex,
          onTap: TabsRouter.setActiveIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.greyText,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorites',
            ),
          ]);
      },
    );
  }
}

