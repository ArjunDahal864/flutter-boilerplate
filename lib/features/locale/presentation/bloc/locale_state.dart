part of 'locale_bloc.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();  

  @override
  List<Object> get props => [];
}
class LocaleInitialState extends LocaleState {}
class LocaleLoadingState extends LocaleState {}
class LocaleLoadedState extends LocaleState {
  final Locale locale;
  const LocaleLoadedState({required this.locale});
  @override
  List<Object> get props => [locale];
}
class LocaleErrorState extends LocaleState {
  final String error;
  const LocaleErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
