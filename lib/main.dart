import 'package:flutter/material.dart';
import 'screens/splash_screen_0.dart';
// import 'screens/splash_screen_1.dart';
import 'screens/splash_screen_2.dart';
import 'screens/splash_screen_3.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash0',
      routes: {
        '/splash0': (context) => const SplashScreen0(),
        // '/splash1': (context) => const SplashScreen1(),
        '/splash2': (context) => const SplashScreen2(),
        '/splash3': (context) => const SplashScreen3(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
