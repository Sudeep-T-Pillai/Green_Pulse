import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:green_pulse/pages/getstartedhome.dart';

class AuthUser extends StatefulWidget{
   AuthUser({Key? key}) : super(key: key);

    @override
    State<AuthUser> createState() => _AuthPageState();

}

class _AuthPageState extends State<AuthUser> {
  @override

  // TODO: implement widget
  Widget build(BuildContext context){
    return Scaffold(
         
         body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return Dashboard();
            }else{
              return getstartedhome();
            }

          },

         )
    );
  }
}
