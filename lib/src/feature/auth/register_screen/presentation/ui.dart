import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/widget/input_component.dart';
import 'package:personal_finance_app/src/feature/auth/login_screen/presentation/widget/login_button.dart';
import 'package:personal_finance_app/src/feature/auth/register_screen/presentation/ui_wrapper.dart';
import 'package:personal_finance_app/src/feature/main_screen/presentation/ui.dart';
import 'package:personal_finance_app/src/feature/main_screen/presentation/ui_wrapper.dart';

import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RegisterScreenWrapper(
      child: Scaffold(
        body: BlocListener<RegisterScreenBloc, RegisterScreenState>(
          listener: (context, state) {
            if (state.status == RegisterScreenStatus.success) {
              // Navigate only when registration is successful
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreenWrapper(child: MainScreen()))
              );
            } else if (state.status == RegisterScreenStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? "Ro'yxatdan o'tishda xatolik yuz berdi"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
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
                      const Text("Finance Tracker",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 32)),
                      const SizedBox(height: 40),

                      InputComponent(
                        hintName: "Ali",
                        controller: nameController,
                        keyBoardType: TextInputType.name,
                        inputText: "",
                        inputName: "Ismingizni kiriting",
                      ),
                      const SizedBox(height: 16),

                      // Email Input
                      InputComponent(
                        hintName: "ali@gmail.com",
                        controller: emailController,
                        keyBoardType: TextInputType.emailAddress,
                        inputText: "",
                        inputName: "Emailingizni kiriting",
                      ),
                      const SizedBox(height: 16),

                      // Password Input
                      InputComponent(
                        hintName: "••••••••",
                        keyBoardType: TextInputType.visiblePassword,
                        inputText: "",
                        controller: passwordController,
                        inputName: "Yangi parol yarating",
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password Input
                      InputComponent(
                        hintName: "••••••••",
                        controller: confirmController,
                        keyBoardType: TextInputType.visiblePassword,
                        inputText: "",
                        inputName: "Parolni takrorlang",
                      ),
                      const SizedBox(height: 40),

                      // Loading indicator or Register button
                      if (state.status == RegisterScreenStatus.loading)
                        const CircularProgressIndicator(color: Colors.white)
                      else
                        LoginButton(
                          onPressed: () {
                            if (nameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Iltimos, ismingizni kiriting"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (emailController.text.isEmpty ||
                                !emailController.text.contains('@')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Iltimos, to'g'ri email manzilini kiriting"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (passwordController.text.isEmpty ||
                                passwordController.text.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Parol kamida 6 ta belgidan iborat bo'lishi kerak"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (passwordController.text != confirmController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Parollar mos emas"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              context.read<RegisterScreenBloc>().add(
                                ClickRegisterButtonEvent(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                            }
                          },
                          text: "Ro‘yxatdan o‘tish",
                        ),

                      const SizedBox(height: 20),

                      // Back to login option
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Hisobingiz bormi? Tizimga kiring",
                          style: TextStyle(color: Colors.white),
                        ),
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
}