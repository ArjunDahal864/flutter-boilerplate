// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnBoardingPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    DashboardPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ProfilePageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    SettingsPageRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashboardPage());
    },
    DashboardOptionRouter.name: (routeData) {
      final args = routeData.argsAs<DashboardOptionRouterArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DashboardOption(key: args.key, option: args.option));
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    ThemeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ThemePage());
    },
    LocaleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LocalePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(OnBoardingRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: 'login'),
        RouteConfig(HomeRoute.name, path: 'home', children: [
          RouteConfig(DashboardPageRouter.name,
              path: 'dashboard',
              parent: HomeRoute.name,
              children: [
                RouteConfig(DashboardRoute.name,
                    path: '', parent: DashboardPageRouter.name),
                RouteConfig(DashboardOptionRouter.name,
                    path: ':option', parent: DashboardPageRouter.name)
              ]),
          RouteConfig(ProfilePageRouter.name,
              path: 'profile', parent: HomeRoute.name),
          RouteConfig(SettingsPageRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
              children: [
                RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsPageRouter.name),
                RouteConfig(ThemeRoute.name,
                    path: 'theme', parent: SettingsPageRouter.name),
                RouteConfig(LocaleRoute.name,
                    path: 'locale', parent: SettingsPageRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: '/');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class DashboardPageRouter extends PageRouteInfo<void> {
  const DashboardPageRouter({List<PageRouteInfo>? children})
      : super(DashboardPageRouter.name,
            path: 'dashboard', initialChildren: children);

  static const String name = 'DashboardPageRouter';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRouter extends PageRouteInfo<void> {
  const ProfilePageRouter() : super(ProfilePageRouter.name, path: 'profile');

  static const String name = 'ProfilePageRouter';
}

/// generated route for
/// [EmptyRouterPage]
class SettingsPageRouter extends PageRouteInfo<void> {
  const SettingsPageRouter({List<PageRouteInfo>? children})
      : super(SettingsPageRouter.name,
            path: 'settings', initialChildren: children);

  static const String name = 'SettingsPageRouter';
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [DashboardOption]
class DashboardOptionRouter extends PageRouteInfo<DashboardOptionRouterArgs> {
  DashboardOptionRouter({Key? key, required DashboardOptionModel option})
      : super(DashboardOptionRouter.name,
            path: ':option',
            args: DashboardOptionRouterArgs(key: key, option: option));

  static const String name = 'DashboardOptionRouter';
}

class DashboardOptionRouterArgs {
  const DashboardOptionRouterArgs({this.key, required this.option});

  final Key? key;

  final DashboardOptionModel option;

  @override
  String toString() {
    return 'DashboardOptionRouterArgs{key: $key, option: $option}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [ThemePage]
class ThemeRoute extends PageRouteInfo<void> {
  const ThemeRoute() : super(ThemeRoute.name, path: 'theme');

  static const String name = 'ThemeRoute';
}

/// generated route for
/// [LocalePage]
class LocaleRoute extends PageRouteInfo<void> {
  const LocaleRoute() : super(LocaleRoute.name, path: 'locale');

  static const String name = 'LocaleRoute';
}
