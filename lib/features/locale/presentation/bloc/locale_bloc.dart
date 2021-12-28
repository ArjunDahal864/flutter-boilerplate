import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:boiler/features/locale/domain/usecases/get_locale.dart';
import 'package:boiler/features/locale/domain/usecases/set_locale.dart';
import 'package:equatable/equatable.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final SetLocale setLocale;
  final GetLocale getLocale;
  LocaleBloc({required this.getLocale, required this.setLocale})
      : super(LocaleInitialState()) {
    on<LocaleEvent>((event, emit) {});
    on<LocaleStatusEvent>((event, emit) async {
      var response = await getLocale.call("uid");
      response.fold(
          (Failure failure) => emit(LocaleErrorState(error: failure.msg)),
          (Locale locale) => emit(LocaleLoadedState(locale: locale)));
    });
    
    on<LocaleChangeEvent>((event, emit) async {
      var response = await setLocale.call(event.locale);
      response.fold(
          (Failure failure) => emit(LocaleErrorState(error: failure.msg)),
          (Locale locale) => emit(LocaleLoadedState(locale: locale)));
    });
  }
}
