import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotpasswordPage extends StatefulWidget {
  const ForgotpasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotpasswordPage> createState() => _forgotpasswordpagestate();
}


class _forgotpasswordpagestate extends State<ForgotpasswordPage> {

  final _emailController = TextEditingController();


  void dispose() {
    _emailController.dispose();
        super.dispose();
  }

  Future passreseted() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(context: context,
          builder: (context){
        return AlertDialog(
          content: Text('otp has been sent to your email!'),
        );
          },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('enter your registered email to send an otp',
            textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.blue,
              fontSize: 24,

            ),),
    ),
          SizedBox(height: 30),

          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25),
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

          SizedBox(height: 30),

    Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
    onTap: passreseted,
    child: Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
    child: const Center(child: Text('Reset password',
    style: TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),
    ),
    ),
    ),
    ),
    ),
          SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 1.0, top: 50, bottom: 0),
            child: Image.asset('images/img.PNG',
              height: 60,
              width: 60,),
          ),

        ],
    ),
    );
  }


}