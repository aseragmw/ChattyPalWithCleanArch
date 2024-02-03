import 'dart:developer';

import 'package:ChattyPal/core/utils/widgets/custom_text_field.dart';
import 'package:ChattyPal/core/utils/app_theme.dart';
import 'package:ChattyPal/core/utils/screen_size.dart';
import 'package:ChattyPal/core/utils/widgets/custom_button.dart';
import 'package:ChattyPal/core/utils/widgets/custom_circluar_progress_indicator.dart';
import 'package:ChattyPal/features/auth/presentation/bloc/basic_auth_provider_bloc/basic_auth_provider_bloc.dart';
import 'package:ChattyPal/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                    BlocConsumer<BasicAuthProviderBloc, BasicAuthProviderState>(builder: ((context, state) {
                      if (state is LoginLoadingState) {
                        return const CustomCircularProgressIndicator();
                      } else {
                        return CustomButton(
                          title: 'Login',
                          onPress: () {
                            context.read<BasicAuthProviderBloc>().add(LoginEvent(emailController.text, passwordController.text));
                          },
                          buttonColor: AppTheme.primaryBlueColor,
                          borderRadius: AppTheme.boxRadius,
                          borderColor: null,
                          buttonWidth: context.screenWidth * 0.8,
                          fontSize: AppTheme.fontSize16(context),
                          buttonHeight: context.screenHeight * 0.08,
                        );
                      }
                    }), listener: (context, state) async {
                      if (state is LoginSuccessState) {
                        log('done');
                        // ToastManager.show(context, 'Login Done Successfuly', Color.fromRGBO(19, 141, 113, 1));
                        // await FirestoreDatabase.updateUser(
                        //     AppConstants.userId!, {'bio': ''});
                        // await FirestoreDatabase.getAllChats();
                        //context.read<ChatsBloc>().add(GetAllChatsEvent());
                        //Navigator.of(context).pushReplacementNamed('homeScreen');
                      } else if (state is LoginErrorState) {
                        log('error');
                        log(state.errorMeessage);
                        // ToastManager.show(context, state.errorMeessage, Color.fromARGB(255, 129, 28, 21));
                      }
                    }),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    Text(
                      '''Don't you have an account?''',
                      style:
                          TextStyle(fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight500, color: AppTheme.blackColor),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.015,
                    ),
                    InkWell(
                      child: Text(
                        'Sign up here',
                        style: TextStyle(
                            fontSize: AppTheme.fontSize14(context), fontWeight: AppTheme.fontWeight700, color: AppTheme.primaryBlueColor),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignUpScreen()), (route) => false),
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
