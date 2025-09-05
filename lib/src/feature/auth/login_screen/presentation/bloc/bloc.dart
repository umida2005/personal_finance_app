import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/domain/login_repository.dart';

import 'event.dart';
import 'state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final LoginScreenRepository _repository;

  LoginScreenBloc(this._repository) : super(LoginScreenState()) {
    on<ClickLoginButton>((event, emit) async {
      emit(state.copyWith(status: LoginScreenStatus.loading));

      try {
        await _repository.loginUser(event.email,event.password);

        emit(state.copyWith(
          password: event.password,
          email: event.email,
          status: LoginScreenStatus.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: LoginScreenStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });  }
}
