import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';

class RegisterScreenWrapper extends StatelessWidget {
  final Widget child;

  const RegisterScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterScreenBloc>(
      create: (_) => RegisterScreenBloc(GetIt.I.get()),
      child: child,
    );
  }
}
