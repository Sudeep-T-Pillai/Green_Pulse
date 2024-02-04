import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_pulse/Firebase/Auth/Auth.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRegister extends StatefulWidget {
  UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
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
              Text(
                'Hey there!',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(height: 5,),
              Text(
                'Welcome To Green Pulse!',
                style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40,),
              // Wrap your form with a Form widget
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextFormField(
                      controller: _usernameController,
                      hintText: 'Username',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    buildTextFormField(
                      controller: _emailController,
                      hintText: 'Enter Email',
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    buildTextFormField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    buildTextFormField(
                      controller: _passwordController, // Assuming you want to confirm the password
                      hintText: 'Confirm Password',
                      obscureText: true,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 85,),
                    // Submit button
                    Center(
                      child: MaterialButton(
                        onPressed: _signUp,
                        color: Color.fromARGB(255, 134, 157, 240),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 80.0,
                          vertical: 20.0,
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Or Sign up using Google',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 5,),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('lib/images/—Pngtree—google internet icon vector_12256707.png', height: 60.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
  
  void _signUp() async {
  if (_formKey.currentState!.validate()) {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("Registration successful");

     await addUserDetails(
            _usernameController.text,
            _emailController.text,
      );

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

       Future addUserDetails(String userName, String email) async {
       final uid = FirebaseAuth.instance.currentUser?.uid;
  
       if (uid != null) {
       await FirebaseFirestore.instance.collection('Users').doc(uid).set({
          'UserName': userName,
          'email': email,
        });
      }
    } 


}
