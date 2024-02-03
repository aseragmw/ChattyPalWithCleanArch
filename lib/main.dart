import 'package:chatty_pal/features/auth/presentation/bloc/basic_auth_provider_bloc/basic_auth_provider_bloc.dart';
import 'package:chatty_pal/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:chatty_pal/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => BasicAuthProviderBloc())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ChattyPal',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SignUpScreen(),
        ));
  }
}
