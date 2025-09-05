class LoginScreenState {
  final String email;
  final String password;
  final String errorMessage;
  final LoginScreenStatus status;

  LoginScreenState(
      {this.email = "",
      this.password = "",
      this.errorMessage = "",
      this.status = LoginScreenStatus.none});

  LoginScreenState copyWith(
      {String? email,
      String? password,
      String? errorMessage,
      LoginScreenStatus? status}) {
    return LoginScreenState(
        email: email ?? this.email,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status);
  }
}

enum LoginScreenStatus { loading, success, failure, none }
