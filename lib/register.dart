import 'package:flutter/material.dart';
import 'package:flutter_seizure_detection/patiant_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String name= "" , email= "" , pass = "" ;
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
                    name = value.toString().trim();
                  },
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      prefixIcon: Icon(
                        Icons.supervised_user_circle_outlined,
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
                  validator: (value){
                    if(value!.isEmpty){
                      email = value;
                    }
                  },
                    onChanged: (v){
                    email = v ;
                    },
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
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
                  validator: (v){
                    if(v!.isEmpty){
                      pass = v;
                    }
                  },
                    onChanged: (v){
                    pass = v;
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
                      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
                     await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PatientInfo(userId :_auth.currentUser!.uid)),
                      );
                    }on FirebaseAuthException catch (e){}



                  },
                  child: Text('Sign Up'),
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
                  Text('Already have an account ?'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Sign In' , style: TextStyle(
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
