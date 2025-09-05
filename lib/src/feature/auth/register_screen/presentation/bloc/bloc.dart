import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/domain/register_screen_repository.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/presentation/bloc/state.dart';

import 'event.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final RegisterScreenRepository _repository;

  RegisterScreenBloc(this._repository) : super(RegisterScreenState()) {
    on<ClickRegisterButtonEvent>((event, emit) async {
      emit(state.copyWith(status: RegisterScreenStatus.loading));

      try {
        await _repository.registerUser(event.name, event.email, event.password);

        emit(state.copyWith(
          name: event.name,
          password: event.password,
          email: event.email,
          status: RegisterScreenStatus.success,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: RegisterScreenStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}