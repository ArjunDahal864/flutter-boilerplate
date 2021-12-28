part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class LocaleStatusEvent extends LocaleEvent{}
class LocaleChangeEvent extends LocaleEvent{
  final Locale locale;
  const LocaleChangeEvent({required this.locale});
}
