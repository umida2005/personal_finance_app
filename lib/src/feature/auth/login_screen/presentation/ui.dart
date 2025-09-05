import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/bloc/event.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/widget/input_component.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/widget/login_button.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/presentation/ui.dart';
import 'package:personal_finance_app/src/feature/main_screen/presentation/ui.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';
import 'ui_wrapper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginScreenWrapper(
      child: Scaffold(
        body: BlocListener<LoginScreenBloc, LoginScreenState>(
          listener: (context, state) {
            if (state.status == LoginScreenStatus.success) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            } else if (state.status == LoginScreenStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
            builder: (context, state) {
              return Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF734CA0),
                      Color(0xFF6B63C0),
                      Color(0xFF6576DA),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/coin.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text("Finance Tracker",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 32)),
                      const SizedBox(height: 10),
                      const Text("Moliyangizni oson boshqaring",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 40),

                      InputComponent(
                        hintName: "hellomello@gmail.com",
                        keyBoardType: TextInputType.emailAddress,
                        inputText: "",
                        inputName: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),

                      InputComponent(
                        hintName: "•••••••••••••",
                        keyBoardType: TextInputType.visiblePassword,
                        inputText: "",
                        controller: passwordController,
                        inputName: "Parol",
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                          },
                          child: const Text(
                            "Parolni unutdingizmi?",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      if (state.status == LoginScreenStatus.loading)
                        const CircularProgressIndicator(color: Colors.white)
                      else
                        LoginButton(
                          onPressed: () {

                            if (_validateInputs(context)) {
                              context.read<LoginScreenBloc>().add(
                                ClickLoginButton(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            }
                          },
                          text: "Kirish",
                        ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hisobingiz yo'qmi? ",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Ro'yxatdan o'tish",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF647AE1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool _validateInputs(BuildContext context) {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos, email manzilingizni kiriting"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos, to'g'ri email formatini kiriting"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos, parolingizni kiriting"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Parol kamida 6 ta belgidan iborat bo'lishi kerak"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }
}