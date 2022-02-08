part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class OnSettingsInitialState extends SettingsState {}
class OnLogoutState extends SettingsState {}
class OnLogoutCompleteState extends SettingsState {}
class OnSettingsErrorState extends SettingsState {
  final String errorMessage;
  const OnSettingsErrorState({required this.errorMessage});
}

