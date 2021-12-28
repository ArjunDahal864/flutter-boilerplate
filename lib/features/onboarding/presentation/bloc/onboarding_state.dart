part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();
  
  @override
  List<Object> get props => [];
}

class OnBoardingInitialState extends OnBoardingState {}
class OnBoardingCompletedState extends OnBoardingState {}
class OnBoardingErrorState extends OnBoardingState {
  final String errorMessage;
  const OnBoardingErrorState({required this.errorMessage});
}