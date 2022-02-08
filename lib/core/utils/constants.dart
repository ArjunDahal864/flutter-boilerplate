// ============ application pages ============
import 'package:boiler/features/locale/domain/entities/locale.dart';

const String kHomePage = 'home';
const String kRegisterPage = 'register';
const String kLoginPage = 'login';
const String kDashboardPage = 'dashboard';
const String kProfilePage = 'profile';
const String kSettingsPage = 'settings';
const String kLocalePage = 'locale';

// ============ application routes ============
const String kDashboardPageRouter = 'DashboardPageRouter';
const String kProfilePageRouter = 'ProfilePageRouter';
const String kSettingsPageRouter = 'SettingsPageRouter';

// ============= http - api ==============
const String kBaseURL = 'http://';
const String kLoginURL = 'login/';
const String kRegisterURL = 'register/';
const String kHomeURL = 'home/';
const String kLogoutURL = 'logout/';
const String kProfileURL = 'profile/';
const String kOnbaordingURL = 'onboarding/';
const String kThemeURL = 'theme/';
const String kLocaleURL = 'locale/';
const String kRefreshTokenURL = 'refresh-token/';

// ============ secrect key and storage keys / id =============
const String kSecrectKey = 'secretKey';
const String kIsOnBoardingComplete = 'isOnBoardingComplete';
const String kTheme = 'theme';
const String kLocale = 'locale';

// ============ app theme =============
const String kLightTheme = 'LIGHT';
const String kDarkTheme = 'DARK';


// supported locales
const List<Locale> kSupportedLocales = [
  Locale(languageCode: 'en', countryCode: 'US',userID: ""),
  Locale(languageCode: 'ne', countryCode: 'NP',userID: ""),
];
