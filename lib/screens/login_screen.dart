import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
    const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Adjust for spacing
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            Image.asset("assets/login_illustration.png", height: 150),
            const SizedBox(height: 20),
            const Text(
              "Hello, Welcome Back",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Happy to see you again, to use your account please login first.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildTextField("Email Address"),
            const SizedBox(height: 15),
            _buildTextField("Password", obscureText: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?", style: TextStyle(color: Colors.purple)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(height: 20),
            const Text("Or Login with", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 15),
            _buildSocialButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialButton("assets/google.png"),
        const SizedBox(width: 20),
        _socialButton("assets/apple.png"),
        const SizedBox(width: 20),
        _socialButton("assets/facebook.png"),
      ],
    );
  }

  Widget _socialButton(String assetPath) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade200,
      child: Image.asset(assetPath, height: 24),
    );
  }
}

