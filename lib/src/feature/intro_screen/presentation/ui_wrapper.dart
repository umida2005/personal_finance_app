import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
import 'bloc/event.dart';

class IntroScreenWrapper extends StatelessWidget {
  final Widget child;

  const IntroScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IntroScreenBloc>(
      create: (_) => IntroScreenBloc(GetIt.I.get())..add(Started()),

      child: child,
    );
  }
}
