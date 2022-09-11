import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgotpass.dart';

class jobseekerlogin extends StatefulWidget {
  const jobseekerlogin({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  State<jobseekerlogin> createState() => _jobseekerloginstate();
}

class _jobseekerloginstate extends State<jobseekerlogin> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//sign in function
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: _emailController.text.trim(),
  password: _passwordController.text.trim(),
  );
}

@override
void dispose(){
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
         child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Image.asset('images/img.PNG',
                height: 160,
                width: 160,),
              SizedBox(height:40 ),
              Text('Job seeker login',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),

              ),


              //email field
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding:  EdgeInsets.only(top: 60.0),
                  ),
                  Container(
                    child:  Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 22,
                            ),
                            hintText: 'Enter valid email id as abc@gmail.com'),
                      ),

                    ),
                  ),



                  //password field
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:  <Widget> [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 30, bottom: 30),
                          //padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 20,
                                ),
                                hintText: 'Enter secure password'),
                          ),
                        ),

                        //Forget pass
                        Padding(
                          padding: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return ForgotpasswordPage();
                                  },
                                  ),
                              );
                            },
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      ]
                  ),


                  SizedBox(
                    height: 15,
                  ),



                  //login button
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text('Sign in',
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ),
                      ),
                    ),
                  ),






                  const SizedBox(
                    height: 120,
                  ),


                ],
              ),

// sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User?'),
                  Text('Register Now', style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              )


            ],
          ),
         ),
        ),
      ),
    );
  }
}