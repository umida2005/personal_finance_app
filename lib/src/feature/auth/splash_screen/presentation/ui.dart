import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/ui.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';
import 'ui_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenWrapper(
      child: Scaffold(
        body: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            return Container(
              color: Colors.blueAccent,
            );
          },
        ),
      ),
    );
  }
}
