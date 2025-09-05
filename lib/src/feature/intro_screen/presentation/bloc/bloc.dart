
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/core/model/screen.dart';
import 'package:personal_finance_app/src/feature/intro_screen/presentation/bloc/state.dart';
import 'package:personal_finance_app/src/shared/data/app_shared_prefs.dart';

import 'event.dart';

class IntroScreenBloc extends Bloc<IntroScreenEvent, IntroScreenState> {
  final AppSharedPrefs appSharedPrefs;

  IntroScreenBloc(this.appSharedPrefs) : super(IntroScreenState()) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(Started event, Emitter<IntroScreenState> emit) async {
    final isLoggedIn = await appSharedPrefs.authenticated();
    final pin = await appSharedPrefs.getPin();

    if (!isLoggedIn) {
      emit(state.copyWith(nextScreen: Screen.login));
    } else if (pin == null) {
      emit(state.copyWith(nextScreen: Screen.setPinCode));
    } else {
      emit(state.copyWith(nextScreen: Screen.checkPinCode));
    }
  }
}
