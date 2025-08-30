import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class EditPasswordScreenWrapper extends StatelessWidget {
  final Widget child;

  const EditPasswordScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditPasswordScreenBloc>(
      create: (_) => EditPasswordScreenBloc(),
      child: child,
    );
  }
}
