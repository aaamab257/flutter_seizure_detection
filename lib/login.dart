import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/main.dart';
import 'package:flutter_seizure_detection/menu.dart';
import 'package:flutter_seizure_detection/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8D9E4),
      appBar: AppBar(
        backgroundColor: const Color(0xffE8D9E4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                scale: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                  onChanged: (value){
                    email = value.toString().trim();
                  },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Password";
                      }
                    },
                    onChanged: (value) {
                      pass = value;
                    },
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      fillColor: const Color(0xffE8D9E4),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    try{
                      await _auth.signInWithEmailAndPassword(email: email, password: pass);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuHome()),
                      );
                    } on FirebaseAuthException catch (e){}
                  },
                  child: Text('Sign In'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all( Colors.lightBlue),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Dont have an account ?'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Sign Up' , style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
