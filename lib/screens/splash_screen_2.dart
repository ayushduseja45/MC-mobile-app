// import 'package:flutter/material.dart';
// import 'splash_screen_3.dart';

// class SplashScreen2 extends StatelessWidget {
//   const SplashScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('assets/splash_image.png', height: 300),
//           const SizedBox(height: 20),
//           const Text(
//             "Chat Smarter, Not Harder",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Experience intuitive messaging with a sleek and modern interface.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ),
//           const SizedBox(height: 40),
//           IconButton(
//             icon: const Icon(Icons.arrow_forward, size: 30, color: Colors.purple),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SplashScreen3()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'splash_screen_3.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the fade-in animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash_image.png', height: 300),
            const SizedBox(height: 20),
            const Text(
              "Chat Smarter, Not Harder",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Experience intuitive messaging with a sleek and modern interface.",
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
                  MaterialPageRoute(builder: (context) => const SplashScreen3()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
