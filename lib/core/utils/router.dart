import 'package:auto_route/auto_route.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:boiler/features/dashboard_option/presentation/pages/dashboard_option.dart';
import 'package:boiler/features/home/presentation/pages/home_page.dart';
import 'package:boiler/features/locale/presentation/pages/locale_page.dart';
import 'package:boiler/features/login/presentation/pages/login_page.dart';
import 'package:boiler/features/onboarding/presentation/pages/on_boarding_page.dart';
import 'package:boiler/features/profile/presentation/pages/profile_page.dart';
import 'package:boiler/features/settings/presentation/pages/settings_page.dart';
import 'package:boiler/features/theme/presentation/pages/theme_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: OnBoardingPage, initial: true),
    AutoRoute(path: kLoginPage, page: LoginPage),
    // home page
    AutoRoute(
      path: kHomePage,
      page: HomePage,
      children: [
        AutoRoute(
          path: kDashboardPage,
          name: kDashboardPageRouter,
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: DashboardPage,
            ),
            AutoRoute(
              path: ':option',
              page: DashboardOption,
              name: "DashboardOptionRouter",
            ),
            // TODO: Add more dashboard pages
          ],
        ),
        // TODO: Add more home pages
        AutoRoute(
          path: kProfilePage,
          page: ProfilePage,
          name: kProfilePageRouter,
        ),
        AutoRoute(
            path: kSettingsPage,
            page: EmptyRouterPage,
            name: kSettingsPageRouter,
            children: [
              AutoRoute(
                path: '',
                page: SettingsPage,
              ),
              AutoRoute(
                path: kTheme,
                page: ThemePage,
              ),
              AutoRoute(
                path: kLocalePage,
                page: LocalePage,
              ),
            ])
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
