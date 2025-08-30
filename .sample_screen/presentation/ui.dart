import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';
import 'ui_wrapper.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EditPasswordScreenWrapper(
      child: Scaffold(
        body: BlocBuilder<EditPasswordScreenBloc, EditPasswordScreenState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
