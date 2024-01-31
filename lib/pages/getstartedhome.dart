import 'package:flutter/material.dart';
import 'package:green_pulse/pages/userlogin.dart';


class getstartedhome extends StatelessWidget {
  const getstartedhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 134, 157, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: [
          Image.asset('lib/images/Green_Pulse-removebg-preview.png'),
          const SizedBox(height: 10), // Add spacing between image and button
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserLogin()));
            }, // Replace with your desired action
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 20.0,
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 134, 157, 240),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
