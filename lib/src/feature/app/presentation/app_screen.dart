import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/intro_screen/presentation/ui.dart';
import 'app_screen_wrapper.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class App extends StatelessWidget {
  const App({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {

          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
            ),
          );

          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  IntroScreen(),
          );
        },
      ),
    );
  }


}
