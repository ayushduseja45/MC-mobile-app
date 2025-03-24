
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final ImagePicker _picker = ImagePicker();
//   List<Widget> _messages = [
//     const ListTile(title: Text("Hello!", style: TextStyle(color: Colors.purple))),
//     const ListTile(title: Text("Hey! How are you?", textAlign: TextAlign.right)),
//     const ListTile(title: Text("Did you watch the match?")),
//     const ListTile(title: Text("Yes, it was great!", textAlign: TextAlign.right)),
//   ];

//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       setState(() {
//         _messages.add(
//           ListTile(
//             title: Image.file(File(image.path)),
//           ),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Robert Fox")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: _messages,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.photo_camera, color: Colors.purple),
//                   onPressed: () => _pickImage(ImageSource.camera),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.photo_library, color: Colors.purple),
//                   onPressed: () => _pickImage(ImageSource.gallery),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(hintText: "Type a message..."),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send, color: Colors.purple),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart' as latlong;
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final ImagePicker _picker = ImagePicker();
//   List<Widget> _messages = [
//     const ListTile(title: Text("Hello!", style: TextStyle(color: Colors.purple))),
//     const ListTile(title: Text("Hey! How are you?", textAlign: TextAlign.right)),
//     const ListTile(title: Text("Did you watch the match?")),
//     const ListTile(title: Text("Yes, it was great!", textAlign: TextAlign.right)),
//   ];

//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       setState(() {
//         _messages.add(
//           ListTile(
//             title: Image.file(File(image.path)),
//           ),
//         );
//       });
//     }
//   }

//   Future<void> _sendLocation() async {
//     try {
//       // Check if location services are enabled
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         return Future.error('Location services are disabled.');
//       }

//       // Check and request location permissions
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           return Future.error('Location permissions are denied');
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//       }

//       // Get the current position
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       // Use the alias 'latlong' to specify the LatLng class from latlong2
//       latlong.LatLng latLng = latlong.LatLng(position.latitude, position.longitude);

//       // Convert to GoogleMap's LatLng
//       LatLng googleLatLng = LatLng(position.latitude, position.longitude);

//       setState(() {
//         _messages.add(
//           ListTile(
//             title: Text("Location: ${latLng.latitude}, ${latLng.longitude}"),
//             subtitle: SizedBox(
//               height: 200,
//               child: GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: googleLatLng,
//                   zoom: 15,
//                 ),
//                 markers: {
//                   Marker(
//                     markerId: const MarkerId('currentLocation'),
//                     position: googleLatLng,
//                   ),
//                 },
//               ),
//             ),
//           ),
//         );
//       });
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Robert Fox")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: _messages,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.photo_camera, color: Colors.purple),
//                   onPressed: () => _pickImage(ImageSource.camera),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.photo_library, color: Colors.purple),
//                   onPressed: () => _pickImage(ImageSource.gallery),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.location_on, color: Colors.purple),
//                   onPressed: _sendLocation,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(hintText: "Type a message..."),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send, color: Colors.purple),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ImagePicker _picker = ImagePicker();
  List<Widget> _messages = [
    const ListTile(title: Text("Hello!", style: TextStyle(color: Colors.purple))),
    const ListTile(title: Text("Hey! How are you?", textAlign: TextAlign.right)),
    const ListTile(title: Text("Did you watch the match?")),
    const ListTile(title: Text("Yes, it was great!", textAlign: TextAlign.right)),
  ];

  final TextEditingController _textController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _messages.add(
          ListTile(
            title: Image.file(File(image.path)),
          ),
        );
      });
    }
  }

  Future<void> _sendLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      // Check and request location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Show options to view or send location
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.map),
                  title: const Text('View Location'),
                  onTap: () {
                    _viewLocationInGoogleMaps(position.latitude, position.longitude);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.send),
                  title: const Text('Send Location'),
                  onTap: () {
                    _sendLocationMessage(position.latitude, position.longitude);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> _viewLocationInGoogleMaps(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  void _sendLocationMessage(double latitude, double longitude) {
    // Convert to GoogleMap's LatLng
    LatLng googleLatLng = LatLng(latitude, longitude);

    setState(() {
      _messages.add(
        ListTile(
          title: Text("Location: $latitude, $longitude"),
          subtitle: SizedBox(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: googleLatLng,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: googleLatLng,
                ),
              },
            ),
          ),
        ),
      );
    });
  }

  void _sendTextMessage() {
    String text = _textController.text;
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(
          ListTile(
            title: Text(text, textAlign: TextAlign.right),
          ),
        );
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Robert Fox")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _messages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo_camera, color: Colors.purple),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                IconButton(
                  icon: const Icon(Icons.photo_library, color: Colors.purple),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.purple),
                  onPressed: _sendLocation,
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.purple),
                  onPressed: _sendTextMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
