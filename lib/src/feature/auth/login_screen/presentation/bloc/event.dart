abstract class LoginScreenEvent {
  const LoginScreenEvent();
}
class ClickLoginButton extends LoginScreenEvent{
  final String email;
  final String password;
  ClickLoginButton(this.email,this.password);
}
