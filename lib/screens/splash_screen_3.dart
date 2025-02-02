// import 'package:flutter/material.dart';
// import 'login_screen.dart';
// class SplashScreen3 extends StatelessWidget {
//   const SplashScreen3({Key? key}) : super(key: key);

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
//             "Start Your Journey Todayyyy",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               "Unlock a world of conversations—connect, share, and engage.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ),
//           const SizedBox(height: 40),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => const LoginScreen()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 233, 144, 249),
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//             ),
//             child: const Text("Get Started", style: TextStyle(fontSize: 18)),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),  // Adjust duration as needed
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start position (off-screen to the right)
      end: Offset.zero, // End position (on screen)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Animation curve
    ));

    // Start the animation
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated image with slide animation
          SlideTransition(
            position: _slideAnimation,
            child: Image.asset('assets/splash_image.png', height: 300),
          ),
          const SizedBox(height: 20),
          const Text(
            "Start Your Journey Todayyyy",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Unlock a world of conversations—connect, share, and engage.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 233, 144, 249),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text("Get Started", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
