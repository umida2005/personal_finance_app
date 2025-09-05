
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/core/model/screen.dart';
import 'package:personal_finance_app/src/feature/auth/splash_screen/presentation/ui.dart';
import 'package:personal_finance_app/src/feature/intro_screen/presentation/ui_wrapper.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenWrapper(
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<IntroScreenBloc, IntroScreenState>(
            listener: (context, state) {
              final screen = state.nextScreen;
              if (screen != null) {
                _handleNextScreen(screen, context);
              }
            },
            builder: (context, state) {
              return const Center();
            },
          ),
        ),
      ),
    );
  }

  void _handleNextScreen(Screen screen, BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SplashScreen()))
;    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return switch (screen) {
    //         Screen.login => const AuthScreen(),
    //         Screen.setPinCode => SetPinScreen(origin: screen),
    //         Screen.checkPinCode => CheckPinScreen(origin: screen),
    //         Screen.myCar => const MyCarScreen(),
    //         Screen.profile => throw UnimplementedError(),
    //       };
    //     },
    //   ),
    // );
  }
}
