import 'package:audioplayers/audioplayers.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:boiler/core/device/device_info.dart';
import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/locale/data/datasources/locale_local_data_source.dart';
import 'package:boiler/features/locale/data/repositories/locale_repository_impl.dart';
import 'package:boiler/features/locale/domain/repositories/locale_repository.dart';
import 'package:boiler/features/login/data/datasources/login_local_data_source.dart';
import 'package:boiler/features/login/domain/usecases/logout.dart';
import 'package:boiler/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/google_login.dart';
import 'features/login/domain/usecases/local_login.dart';
import 'features/login/domain/usecases/login.dart';
import 'features/onboarding/data/datasources/on_boarding_local_data_sources.dart';
import 'features/onboarding/data/datasources/on_boarding_remote_data_source.dart';
import 'package:boiler/features/onboarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:boiler/features/onboarding/domain/repositories/on_boarding_repository.dart';
import 'package:boiler/features/onboarding/domain/usecases/get_on_boarding.dart';
import 'package:boiler/features/onboarding/domain/usecases/set_on_boarding.dart';
import 'package:boiler/features/theme/data/datasources/application_theme_local_data_source.dart';
import 'package:boiler/features/theme/data/datasources/application_theme_remote_datasource.dart';
import 'package:boiler/features/theme/domain/usecases/set_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/locale/data/datasources/locale_remote_data_source.dart';
import 'features/locale/domain/usecases/get_locale.dart';
import 'features/locale/domain/usecases/set_locale.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/theme/data/repositories/application_theme_repository_impl.dart';
import 'features/theme/domain/repositories/application_theme_repository.dart';
import 'features/theme/domain/usecases/get_theme.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';

final locator = GetIt.instance;

// SOLID
// S - Single Responsibility Principle
// O - Open/Closed Principle
// L - Liskov Substitution Principle
// I - Interface Segregation Principle
// D - Dependency Inversion Principle


// this file is for registering all the dependencies


Future<void> setupLocator() async {
  // initialize hive
  await Hive.initFlutter();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  // external layer

  // plugins for network calls
  locator.registerLazySingleton(() => Dio());

  /// plugins for storage and other stuffs
  /*shared pref class returns Future<SharedPreferences> but we need to have 
  SharedPreferences only so 
   we await it and then we register it as a singleton
   */
  final sharedPref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPref);
  locator.registerLazySingleton(() => Hive.openBox('users'));
  locator.registerLazySingleton(() => const FlutterSecureStorage());

  // plugins for local authetincation
  locator.registerLazySingleton(() => LocalAuthentication());

  // plugins for device level info
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => Geolocator());
  var filePicker = FilePicker.platform;
  locator.registerLazySingleton(() => filePicker);
  locator.registerLazySingleton(() => ImagePicker());
  locator.registerLazySingleton(() => Battery());
  locator.registerLazySingleton(() => AudioPlayer());
  locator.registerLazySingleton(() => AudioCache());
  locator.registerLazySingleton(() => DeviceInfoPlugin());

  // core
  locator.registerLazySingleton(() => NetworkCalls(
        dio: locator<Dio>()
      ));

  // Device info
  locator.registerLazySingleton(
      () => DeviceInfo(deviceInfoPlugin: locator<DeviceInfoPlugin>()));

  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: locator<Connectivity>(),
      ));

  // data sources
  locator.registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(
            sharedPreferences: locator<SharedPreferences>(),
          ));

  locator.registerLazySingleton<OnBoardingRemoteDataSource>(() =>
      OnBoardingRemoteDataSourceImpl(networkCalls: locator<NetworkCalls>()));
  locator.registerLazySingleton<LocaleLocalDataSource>(
      () => LocalLocaleDataSourceImpl(
            sharedPreferences: locator<SharedPreferences>(),
          ));

  locator.registerLazySingleton<LocaleRemoteDataSource>(
      () => LocaleRemoteDataSourceImpl(
            networkCalls: locator<NetworkCalls>(),
            networkInfo: locator<NetworkInfo>(),
          ));

  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(
            networkCalls: locator<NetworkCalls>(),
          ));

  locator.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(
            secureStorage: locator<FlutterSecureStorage>(),
          ));

  locator.registerLazySingleton<ApplicationThemeLocalDataSource>(
      () => ApplicationThemeLocalDataSourceImpl(
            sharedPreferences: locator<SharedPreferences>(),
          ));

  locator.registerLazySingleton<ApplicationThemeRemoteDataSource>(
      () => ApplicationThemeRemoteDataSourceImpl(
            networkCalls: locator<NetworkCalls>(),
          ));
  // repository
  locator.registerLazySingleton<OnBoardingRepository>(() =>
      OnBoardingRepositoryImpl(
          deviceInfo: locator<DeviceInfo>(),
          localDataSource: locator<OnBoardingLocalDataSource>(),
          remoteDataSource: locator<OnBoardingRemoteDataSource>(),
          networkInfo: locator<NetworkInfo>()));

  locator.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(
      localDataSource: locator<LocaleLocalDataSource>(),
      localeRemoteDataSource: locator<LocaleRemoteDataSource>(),
      networkInfo: locator<NetworkInfo>()));

  locator.registerLazySingleton<ApplicationThemeRepository>(() =>
      ApplicationThemeRepositoryImpl(
          deviceInfo: locator<DeviceInfo>(),
          localDataSource: locator<ApplicationThemeLocalDataSource>(),
          remoteDataSource: locator<ApplicationThemeRemoteDataSource>(),
          networkInfo: locator<NetworkInfo>()));

  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        remoteLoginDataSource: locator<LoginRemoteDataSource>(),
        localLoginDataSource: locator<LoginLocalDataSource>(),
        localAuthentication: locator<LocalAuthentication>(),
        networkInfo: locator<NetworkInfo>(),
      ));

  // use cases

  locator.registerLazySingleton(() => SetOnBoarding(
        repository: locator<OnBoardingRepository>(),
      ));

  locator.registerLazySingleton(() => GetOnBoarding(
        repository: locator<OnBoardingRepository>(),
      ));

  locator.registerLazySingleton(() => SetTheme(
        applicationThemeRepository: locator<ApplicationThemeRepository>(),
      ));
  locator.registerLazySingleton(() => GetTheme(
        applicationThemeRepository: locator<ApplicationThemeRepository>(),
      ));

  locator.registerLazySingleton(() => Login(
        repository: locator<LoginRepository>(),
      ));
  locator.registerLazySingleton(() => Logout(
    loginRepository: locator<LoginRepository>(),
  ));

  locator.registerLazySingleton(() => LocalLogin(
        repository: locator<LoginRepository>(),
      ));

  locator.registerLazySingleton(() => GoogleLogin(
        loginRepository: locator<LoginRepository>(),
      ));
      
  locator.registerLazySingleton(() => GetLocale(
        repository: locator<LocaleRepository>(),
      ));
  locator.registerLazySingleton(() => SetLocale(
        repository: locator<LocaleRepository>(),
      ));
  

  locator.registerFactory(() => OnBoardingBloc(
        setOnBoarding: locator<SetOnBoarding>(),
        getOnBoarding: locator<GetOnBoarding>(),
      ));
  locator.registerFactory(() => LocaleBloc(
        setLocale: locator<SetLocale>(),
        getLocale: locator<GetLocale>(),
      ));

  locator.registerFactory(() => ThemeBloc(
        setTheme: locator<SetTheme>(),
        getTheme: locator<GetTheme>(),
      ));

  locator.registerFactory(() => LoginBloc(
        login: locator<Login>(),
        localLogin: locator<LocalLogin>(),
        googleLogin: locator<GoogleLogin>(),
      ));
  locator.registerFactory(() => SettingsBloc(logout: locator<Logout>()));
}
