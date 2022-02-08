import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:boiler/features/onboarding/domain/usecases/get_on_boarding.dart';
import 'package:boiler/features/onboarding/domain/usecases/set_on_boarding.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final SetOnBoarding setOnBoarding;
  final GetOnBoarding getOnBoarding;

  OnBoardingBloc({required this.setOnBoarding, required this.getOnBoarding})
      : super(OnBoardingInitialState()) {
    on<OnBoardingStatusEvent>((event, emit) async {
      var response = await getOnBoarding(NoParams());
      response.fold(
        (Failure failure) =>
            emit(OnBoardingErrorState(errorMessage: failure.msg)),
        (OnBoarding onBoarding) => onBoarding.isOnBoardingCompleted
            ? emit(OnBoardingCompletedState())
            : emit(OnBoardingInitialState()),
      );
    });

    on<OnBoardingEvent>((event, emit) async {
      var response = await getOnBoarding(NoParams());
      response.fold(
        (Failure failure) =>
            emit(OnBoardingErrorState(errorMessage: failure.msg)),
        (OnBoarding onBoarding) => onBoarding.isOnBoardingCompleted
            ? emit(OnBoardingCompletedState())
            : emit(OnBoardingInitialState()),
      );
    });

    on<OnBoardingCompletedEvent>((event, emit) async {
      var response = await setOnBoarding(true);
      response.fold(
          (Failure failure) =>
              emit(OnBoardingErrorState(errorMessage: failure.msg)),
          (OnBoarding done) => done.isOnBoardingCompleted
              ? emit(OnBoardingCompletedState())
              : emit(const OnBoardingErrorState(
                  errorMessage: "cannot save onbaording value")));
    });
  }
}
