import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/feature/main_screen/presentation/bloc/event.dart';

import 'bloc/bloc.dart';

class MainScreenWrapper extends StatelessWidget {
  final Widget child;

  const MainScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (_) => MainScreenBloc(GetIt.I.get())..add(LoadExpenseList()),
      child: child,
    );
  }
}
