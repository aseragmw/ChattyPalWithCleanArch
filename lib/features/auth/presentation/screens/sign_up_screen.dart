import 'dart:developer';

import 'package:ChattyPal/core/utils/app_theme.dart';
import 'package:ChattyPal/core/utils/screen_size.dart';
import 'package:ChattyPal/core/utils/widgets/custom_button.dart';
import 'package:ChattyPal/core/utils/widgets/custom_text_field.dart';
import 'package:ChattyPal/features/auth/presentation/bloc/basic_auth_provider_bloc/basic_auth_provider_bloc.dart';
import 'package:ChattyPal/features/auth/presentation/screens/login_screen.dart';
import 'package:ChattyPal/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.03),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ChattyPal',
                      style: TextStyle(fontWeight: AppTheme.fontWeight700, fontSize: AppTheme.fontSize40(context)),
                    ),
                    Text(
                      'Login With Email & Password',
                      style:
                          TextStyle(color: AppTheme.blackColor, fontWeight: AppTheme.fontWeight600, fontSize: AppTheme.fontSize18(context)),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.04,
                    ),
                    CustomTextField(
                      hintText: 'Enter your name',
                      trailingIcon: null,
                      obsecured: false,
                      controller: nameController,
                      filled: false,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    CustomTextField(
                      hintText: 'Enter your email address',
                      trailingIcon: null,
                      obsecured: false,
                      controller: emailController,
                      filled: false,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    CustomTextField(
                      hintText: 'Enter your password',
                      trailingIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecurePassword = !obsecurePassword;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                          color: AppTheme.greyTwoColor,
                        ),
                      ),
                      obsecured: obsecurePassword,
                      controller: passwordController,
                      filled: false,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    CustomTextField(
                      hintText: 'Confirm your password',
                      trailingIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecurePassword = !obsecurePassword;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_rounded,
                          color: AppTheme.greyTwoColor,
                        ),
                      ),
                      obsecured: obsecurePassword,
                      controller: confirmPasswordController,
                      filled: false,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    BlocConsumer<BasicAuthProviderBloc, BasicAuthProviderState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          // ToastManager.show(context, "Register completed successfuly", Color.fromRGBO(19, 141, 113, 1));
                          log('dene');
                          // Navigator.of(context).pushReplacementNamed('extraDetailsScreen');
                        } else if (state is RegisterErrorState) {
                          log(state.errorMessage);
                          // ToastManager.show(context, state.errorMessage, Color.fromARGB(255, 129, 28, 21));
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(9, 77, 61, 1),
                            ),
                          );
                        } else {
                          return CustomButton(
                            title: 'Sign Up',
                            onPress: () {
                              context
                                  .read<BasicAuthProviderBloc>()
                                  .add(RegisterEvent(emailController.text, passwordController.text, nameController.text));
                            },
                            buttonColor: AppTheme.primaryBlueColor,
                            borderRadius: AppTheme.boxRadius,
                            borderColor: null,
                            buttonWidth: context.screenWidth * 0.8,
                            fontSize: AppTheme.fontSize16(context),
                            buttonHeight: context.screenHeight * 0.08,
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    Text(
                      '''Do you have an account?''',
                      style:
                          TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.015,
                    ),
                    InkWell(
                      child: Text(
                        'login here',
                        style: TextStyle(
                            fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.primaryBlueColor),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
