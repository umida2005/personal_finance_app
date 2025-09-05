abstract class RegisterScreenEvent {
  const RegisterScreenEvent();
}

class ClickRegisterButtonEvent extends RegisterScreenEvent {
  final String name;
  final String email;
  final String password;

  ClickRegisterButtonEvent(this.name, this.email, this.password);
}
