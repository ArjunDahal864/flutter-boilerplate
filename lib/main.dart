import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/utils/router.dart';
import 'package:boiler/core/utils/theme.dart';
import 'package:boiler/features/locale/presentation/bloc/locale_bloc.dart';
import 'package:boiler/features/login/presentation/bloc/login_bloc.dart';
import 'package:boiler/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'injector.dart';

void main() async {
  // insure initialized
  WidgetsFlutterBinding.ensureInitialized();
  // initialize di
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<OnBoardingBloc>()),
        BlocProvider(create: (_) => locator<LoginBloc>()),
        BlocProvider(create: (_) => locator<ThemeBloc>()),
        BlocProvider(create: (_) => locator<LocaleBloc>()),
        BlocProvider(create: (_) => locator<SettingsBloc>()),
      ],
      child: const Application(),
    );
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    BlocProvider.of<ThemeBloc>(context).add(ThemeStatusEvent());
    BlocProvider.of<LocaleBloc>(context).add(LocaleStatusEvent());
    super.initState();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            if (state is ThemeLoadedState && localeState is LocaleLoadedState) {
              return MaterialApp.router(
                  title: 'Boiler',
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: state.theme.themeType == kLightTheme
                      ? AppThemes.lightTheme
                      : AppThemes.darkTheme,
                  locale: Locale(localeState.locale.languageCode),
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: _appRouter.delegate());
            } else {
              return MaterialApp.router(
                  title: 'Boiler',
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: _appRouter.delegate());
            }
          },
        );
      },
    );
  }
}
