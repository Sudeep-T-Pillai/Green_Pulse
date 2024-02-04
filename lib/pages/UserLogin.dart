
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/Firebase/Auth/Auth.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:green_pulse/pages/userregistration.dart';

class UserLogin extends StatefulWidget {
  UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  
  final FirebaseAuthService _auth = FirebaseAuthService();

  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: Text(
                  'Hey there!',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                       }
                        return null;
                      },

                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    obscureText: true,// Set obscureText to true

                    validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your username';
                         }
                         return null;
                       }, 
                  ),
                ),
              ),
              SizedBox(height: 4,),
              Center(
                child: Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Dashboard(),
                    ));
                  },
                  color: Color.fromARGB(255, 134, 157, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 80.0,
                    vertical: 20.0,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 150,),
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 10,),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'lib/images/—Pngtree—google internet icon vector_12256707.png',
                      height: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => UserRegister()),
                    );
                  },
                  child: Text(
                    'New one, Click to Create an Account :)',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 134, 157, 240),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    void _signIn() async {
  if (_formKey.currentState!.validate()) {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("Login successful");
     Navigator.pushAndRemoveUntil(
     context,
     MaterialPageRoute(builder: (context) => Dashboard()),
     (Route<dynamic> route) => false,
    );
    } else {
      print("Registration failed");
    }
  }
}

}
