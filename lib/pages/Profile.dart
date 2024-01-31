import 'package:flutter/material.dart';
import 'package:green_pulse/navigationbar.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Content'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}