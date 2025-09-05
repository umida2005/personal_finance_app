import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';

class LoginScreenWrapper extends StatelessWidget {
  final Widget child;

  const LoginScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginScreenBloc>(
      create: (_) => LoginScreenBloc(GetIt.I.get()),
      child: child,
    );
  }
}
