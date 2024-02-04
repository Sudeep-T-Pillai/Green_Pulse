import 'package:flutter/material.dart';
import 'package:green_pulse/Firebase/Usrnamefetc.dart';
import 'package:green_pulse/navigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final UserProfileService _userService = UserProfileService();

  // Function to handle sign-out
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login page after signing out
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('Error signing out: $e');
      // Handle sign-out error, if any
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  // Your profile picture goes here
                  backgroundImage: AssetImage('lib/images/Bard_Generated_Image.jpeg'),
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder<String?>(
                future: _userService.getUsername(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text('Username not available');
                  }
                },
              ),
              SizedBox(height: 8),
              if (currentUser != null)
                Text(
                 currentUser.email!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _signOut(context),
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
