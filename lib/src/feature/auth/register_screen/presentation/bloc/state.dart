class RegisterScreenState {
  final RegisterScreenStatus? status;
  final String? name;
  final String? email;
  final String? password;
  final String? errorMessage;

  RegisterScreenState({
    this.name,
    this.status,
    this.email,
    this.password,
    this.errorMessage
  });

  RegisterScreenState copyWith({
    RegisterScreenStatus? status,
    String? name,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return RegisterScreenState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum RegisterScreenStatus { success, failure, loading, none }
