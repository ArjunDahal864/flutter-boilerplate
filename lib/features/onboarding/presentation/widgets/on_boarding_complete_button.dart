import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/core/widgets/custom_snackbar.dart';
import 'package:boiler/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class OnBoardingCompleteButton extends StatefulWidget {
  const OnBoardingCompleteButton({Key? key}) : super(key: key);

  @override
  State<OnBoardingCompleteButton> createState() =>
      _OnBoardingCompleteButtonState();
}

class _OnBoardingCompleteButtonState extends State<OnBoardingCompleteButton> {
  @override
  void initState() {
    BlocProvider.of<OnBoardingBloc>(context).add(OnBoardingStatusEvent());
    super.initState();
  }

  @override
  BlocBuilder build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      buildWhen: (previous, current) {
        if (current is OnBoardingCompletedState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            context.router.replaceNamed(kLoginPage);
          });
        }
        return (current is! OnBoardingCompletedState);
      },
      builder: (context, state) {
        if (state is OnBoardingErrorState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            CustomSnackBar.showSnackBar(context, state.errorMessage);
          });
        }
        if (state is OnBoardingCompletedState) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
          context.router.replaceNamed(kLoginPage);
          });
        }
        return CupertinoButton(
          child: const Text('Complete OnBoarding'),
          onPressed: () {
            BlocProvider.of<OnBoardingBloc>(context)
                .add(OnBoardingCompletedEvent());
          },
        );
      },
    );
  }
}
