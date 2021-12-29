```
├── core
│   ├── device
│   │   └── device_info.dart
│   ├── error
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── network
│   │   ├── network_calls.dart
│   │   └── network_info.dart
│   ├── usecase
│   │   └── usecase.dart
│   ├── utils
│   │   ├── constants.dart
│   │   ├── router.dart
│   │   ├── router.gr.dart
│   │   └── theme.dart
│   └── widgets
│       ├── custom_progress_bar.dart
│       └── custom_snackbar.dart
├── features
│   ├── dashboard
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── local_dashboard_data_source.dart
│   │   │   │   └── remote_dashboard_data_source.dart
│   │   │   ├── models
│   │   │   │   └── dashboard_model.dart
│   │   │   └── repositories
│   │   │       └── dashboard_repository_impl.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── dashboard.dart
│   │   │   ├── repositories
│   │   │   │   └── dashboard_repository.dart
│   │   │   └── usecases
│   │   │       └── random_usecase.dart
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── dashboard_bloc.dart
│   │       │   ├── dashboard_event.dart
│   │       │   └── dashboard_state.dart
│   │       ├── pages
│   │       │   └── dashboard_page.dart
│   │       └── widgets
│   ├── dashboard_option
│   │   ├── data
│   │   │   ├── datasources
│   │   │   ├── models
│   │   │   └── repositories
│   │   ├── domain
│   │   │   ├── entities
│   │   │   ├── repositories
│   │   │   └── usecases
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── dashboard_option_one_bloc.dart
│   │       │   ├── dashboard_option_one_event.dart
│   │       │   └── dashboard_option_one_state.dart
│   │       ├── pages
│   │       │   └── dashboard_option.dart
│   │       └── widgets
│   ├── home
│   │   └── presentation
│   │       ├── pages
│   │       │   └── home_page.dart
│   │       └── widgets
│   ├── locale
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── locale_local_data_source.dart
│   │   │   │   └── locale_remote_data_source.dart
│   │   │   ├── models
│   │   │   │   ├── locale_model.dart
│   │   │   │   └── locale_model.g.dart
│   │   │   └── repositories
│   │   │       └── locale_repository_impl.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── locale.dart
│   │   │   ├── repositories
│   │   │   │   └── locale_repository.dart
│   │   │   └── usecases
│   │   │       ├── get_locale.dart
│   │   │       └── set_locale.dart
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── locale_bloc.dart
│   │       │   ├── locale_event.dart
│   │       │   └── locale_state.dart
│   │       ├── pages
│   │       │   └── locale_page.dart
│   │       └── widgets
│   ├── login
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── login_local_data_source.dart
│   │   │   │   └── login_remote_data_source.dart
│   │   │   ├── models
│   │   │   │   ├── login_response_model.dart
│   │   │   │   └── login_response_model.g.dart
│   │   │   └── repositories
│   │   │       └── login_repository_impl.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── login_response.dart
│   │   │   ├── repositories
│   │   │   │   └── login_repository.dart
│   │   │   └── usecases
│   │   │       ├── delete_saved_login.dart
│   │   │       ├── get_saved_login.dart
│   │   │       ├── local_login.dart
│   │   │       └── login.dart
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── login_bloc.dart
│   │       │   ├── login_event.dart
│   │       │   └── login_state.dart
│   │       ├── pages
│   │       │   └── login_page.dart
│   │       └── widgets
│   │           ├── local_login_button.dart
│   │           └── login_button.dart
│   ├── onboarding
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── on_boarding_local_data_sources.dart
│   │   │   │   └── on_boarding_remote_data_source.dart
│   │   │   ├── models
│   │   │   │   ├── on_boarding_model.dart
│   │   │   │   └── on_boarding_model.g.dart
│   │   │   └── repositories
│   │   │       └── on_boarding_repository_impl.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── on_boarding.dart
│   │   │   ├── repositories
│   │   │   │   └── on_boarding_repository.dart
│   │   │   └── usecases
│   │   │       ├── get_on_boarding.dart
│   │   │       └── set_on_boarding.dart
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── onboarding_bloc.dart
│   │       │   ├── onboarding_event.dart
│   │       │   └── onboarding_state.dart
│   │       ├── pages
│   │       │   └── on_boarding_page.dart
│   │       └── widgets
│   │           └── on_boarding_complete_button.dart
│   ├── profile
│   │   ├── data
│   │   │   ├── datasources
│   │   │   ├── models
│   │   │   └── repositories
│   │   ├── domain
│   │   │   ├── entities
│   │   │   ├── repositories
│   │   │   └── usecases
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── profile_bloc.dart
│   │       │   ├── profile_event.dart
│   │       │   └── profile_state.dart
│   │       ├── pages
│   │       │   └── profile_page.dart
│   │       └── widgets
│   ├── settings
│   │   ├── data
│   │   ├── domain
│   │   └── presentation
│   │       ├── bloc
│   │       ├── pages
│   │       │   └── settings_page.dart
│   │       └── widgets
│   └── theme
│       ├── data
│       │   ├── datasources
│       │   │   ├── application_theme_local_data_source.dart
│       │   │   └── application_theme_remote_datasource.dart
│       │   ├── models
│       │   │   ├── application_theme_model.dart
│       │   │   └── application_theme_model.g.dart
│       │   └── repositories
│       │       └── application_theme_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   └── application_theme.dart
│       │   ├── repositories
│       │   │   └── application_theme_repository.dart
│       │   └── usecases
│       │       ├── get_theme.dart
│       │       └── set_theme.dart
│       └── presentation
│           ├── bloc
│           │   ├── theme_bloc.dart
│           │   ├── theme_event.dart
│           │   └── theme_state.dart
│           ├── pages
│           │   └── theme_page.dart
│           └── widgets
├── generated
│   ├── intl
│   │   ├── messages_all.dart
│   │   ├── messages_en.dart
│   │   └── messages_ne.dart
│   └── l10n.dart
├── generated_plugin_registrant.dart
├── injector.dart
├── l10n
│   ├── intl_en.arb
│   └── intl_ne.arb
└── main.dart

```

### packages,plugins and library 
```
dependencies:
  flutter:
    sdk: flutter
#  ============== flutter specific ========
  salomon_bottom_bar:

  cupertino_icons: ^1.0.2
  # ============== core ===============
  flutter_bloc:
  equatable:
  easy_localization:
  dio:
  get_it:
  dartz:

  # ============= routing =============
  auto_route:

  # ================ storage ===============
  shared_preferences:
  hive:
  hive_flutter:
  flutter_secure_storage:
  # ================ analytics =============
  logger:
  # core for firebase
#  firebase_core:

  # for overall analytics (e.g. notification clicks and app opens)
#  firebase_analytics:

  # for crash reporting
#  firebase_crashlytics:

  # for performance tracking
#  firebase_performance:

  # for notification
#  firebase_messaging:

  # for deep link
#  firebase_dynamic_links:


  # ================ notifications =============
  flutter_local_notifications:

  # ================= auth =================
  local_auth:
  google_sign_in:
  flutter_facebook_auth:

  # =============== hardware ===============
  geolocator:
  device_info:
  battery_plus:
  connectivity_plus:
  audioplayers:
  image_picker:
  file_picker:
  # ================== localization =============
  flutter_localizations:
    sdk: flutter



dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
  # build runner
  build_runner:
  # create route 
  auto_route_generator:
  # serialize json
  json_serializable:
  # generate database table
  hive_generator:
  
flutter:
  uses-material-design: true
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
flutter_intl:
  enabled: true
```
#### flutter version
```
Flutter 2.5.3 
Framework • revision 18116933e7 (3 months ago) • 2021-10-15 10:46:35 -0700
Engine • revision d3ea636dc5
Tools • Dart 2.14.4
```
### TODO
- [ ] add test
- [ ] add docs

