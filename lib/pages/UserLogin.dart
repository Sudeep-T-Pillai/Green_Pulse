
import 'package:flutter/material.dart';
import 'package:green_pulse/pages/dashboard.dart';
import 'package:green_pulse/pages/userregistration.dart';

class UserLogin extends StatelessWidget {
         UserLogin({super.key});
        
          @override
          Widget build(BuildContext context) {
            return  Scaffold(
              backgroundColor: Colors.white,
              body:SafeArea(
                child:Column(
                  children: [
                       SizedBox(height: 50,),
                        Center(
                            child: Text('Hey there!',
                              style: TextStyle(color: Colors.black,
                               fontSize: 15
                              ),
                            
                            ),
                          ),

                          SizedBox(height: 5,),

                        //Welcome Back
                          Center(
                            child: Text('Welcome Back!',
                              style: TextStyle(color: Colors.black,
                               fontSize: 25,
                               fontWeight: FontWeight.bold
                              ),
                            
                            ),
                          ),

                        SizedBox(height: 40,),

                        //Username and password
                        Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                               child:TextField(
                               decoration: InputDecoration(
                               border: OutlineInputBorder(),
                               hintText: 'Username',
                               ),
                              ),
                             ),
                        ),

                          // SizedBox(height: 4,),

                          Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                                                  ),
                                    obscureText: true, // Set obscureText to true
                                  ),
                                ),
                              ),

                         SizedBox(height: 4,),     

                        //forget password      
                          Center(
                            child: Text('Forget Password',
                              style: TextStyle(color: Colors.black,
                               fontSize: 15,
                              ),
                            
                            ),
                         //   onTap: () => launchUrlString('https://www.google.com'), 
                          ),

                           SizedBox(height: 40,),

                        //Login button
                           Center(
                              child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Dashboard()));
            }, // Replace with your desired action
            color:Color.fromARGB(255, 134, 157, 240),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 20.0,
            ),
            child:  Text(
              'Login',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),

                           ),



                        //Login with google
                        SizedBox(height: 150,),

                        Center(
                          child: Text('Or',
                           style: TextStyle(
                            fontSize: 15, 
                           ),
                          ),
                        ),

                        SizedBox(height: 10,),

                      Material(
                              child: InkWell(
                              onTap: () {
                             //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserRegister())); to be updated later...
                              },
                              child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('lib/images/—Pngtree—google internet icon vector_12256707.png',
                               height: 60.0),
                                ),
                               ),
                              ),


                        //New user
                         SizedBox(height: 30,),
                         Material(
                          child: InkWell(
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UserRegister()));
                            },
                            child: Text('New one, Click to Create an Account :)',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 134, 157, 240),
                              )
                            )
                          )
                          ,)


                  ],
                ) )
            );
            
          }


}