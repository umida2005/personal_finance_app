
import 'package:personal_finance_app/src/core/model/screen.dart';

class IntroScreenState {
  final Screen? nextScreen;

  IntroScreenState({this.nextScreen});

  IntroScreenState copyWith({Screen? nextScreen}) {
    return IntroScreenState(nextScreen: nextScreen ?? this.nextScreen);
  }
}
