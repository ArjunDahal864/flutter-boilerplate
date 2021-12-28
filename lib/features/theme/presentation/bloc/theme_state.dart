part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();  

  @override
  List<Object> get props => [];
}
class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  final String theme;
  const ThemeChanged({required this.theme});

  @override
  List<Object> get props => [theme];
}

class ThemeErrorState extends ThemeState {}
class ThemeLoadingState extends ThemeState {}
class ThemeLoadedState extends ThemeState {
  final ApplicationTheme theme;
  const ThemeLoadedState({required this.theme});
  @override
  List<Object> get props => [theme];
}
