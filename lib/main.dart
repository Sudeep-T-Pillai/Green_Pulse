import 'package:flutter/material.dart';
import 'package:green_pulse/pages/Analyitcs.dart';
import 'package:green_pulse/pages/Profile.dart';
import 'package:green_pulse/pages/authuser.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:green_pulse/pages/getstartedhome.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   runApp(const MyApp());
}

class MyApp extends StatelessWidget{
           const  MyApp({super.key});


            @override
            Widget build(BuildContext context){
              return  MaterialApp(
                home: AuthUser(),
                routes: {
                     '/dashboard': (context) => Dashboard(),
                     '/analytics': (context) => AnalyticsPage(),
                     '/profile': (context) => ProfilePage(),
                    },
                
              );
            }
}