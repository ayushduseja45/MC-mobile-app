import 'package:flutter/material.dart';
import 'splash_screen_2.dart';

class SplashScreen0 extends StatelessWidget {
  const SplashScreen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash_image.png', height: 300),
          const SizedBox(height: 20),
          const Text(
            "Get Closer To EveryOne",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Helps you to contact everyone with just an easy way",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 40),
          IconButton(
            icon: const Icon(Icons.arrow_forward, size: 30, color: Colors.purple),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen2()),
              );
            },
          ),
        ],
      ),
    );
  }
}
