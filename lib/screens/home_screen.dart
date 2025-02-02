
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search Chat"),
//         actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
//       ),
//       body: ListView(
//         children: List.generate(
//           5,
//           (index) => ListTile(
//             leading: CircleAvatar(child: Text("U$index")),
//             title: Text("User $index"),
//             subtitle: Text("Last message..."),
//             trailing: const Icon(Icons.arrow_forward_ios, size: 14),
//             onTap: () {
//               Navigator.pushNamed(context, '/chat');
//             },
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
//           BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
//           BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with one-time rotation
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2), // Duration of one full rotation
      vsync: this,
    );

    // Define the rotation animation (360 degrees)
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0) // 0.0 to 1.0 as the range for one complete rotation
        .animate(CurvedAnimation(parent: _rotationController, curve: Curves.linear));

    // Trigger the animation to rotate once
    _rotationController.forward();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Chat"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: List.generate(
          5,
          (index) => ListTile(
            leading: RotationTransition(
              turns: _rotationAnimation, // Apply the one-time rotation animation
              child: CircleAvatar(child: Text("U$index")),
            ),
            title: Text("User $index"),
            subtitle: Text("Last message..."),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {
              Navigator.pushNamed(context, '/chat');
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
      ),
    );
  }
}
