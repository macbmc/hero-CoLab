// ignore_for_file: prefer_const_constructors
import 'package:fireb_01/homepage.dart';
import 'package:fireb_01/login.dart';
import 'package:fireb_01/Datab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return HomePage();
            }
            else {
              return SignPP();
            }
          },
        )
    );
  }
}

class SignPP extends StatefulWidget {
  const SignPP({Key? key}) : super(key: key);

  @override
  State<SignPP> createState() => _SignPPState();
}

class _SignPPState extends State<SignPP> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final unameController = TextEditingController();
  final phController = TextEditingController();
  final snackBar = SnackBar(content: Text('Welcome to Hero Community'));
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox (height: 40),
            Text("SignUp",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:20 ),),
            SizedBox (height: 20),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                children: [
                  TextField(
                    controller: unameController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration (
                        labelText: 'Username',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  SizedBox (height: 10),
                  TextField(
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration (
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  SizedBox (height: 10),
                  TextField(
                    controller: passController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration (
                        labelText:"Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    obscureText: true,
                  ),
                  SizedBox (height: 10),
                  TextField(
                    controller: phController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration (
                        labelText:"Phone Number",
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox (height: 20),
            ElevatedButton.icon(onPressed: signUp , icon:Icon(Icons.lock_open, size: 20),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
                onPrimary: Colors.white, // Text Color (Foreground color)
              ),
              label: Text('Signup', style: TextStyle(fontSize: 20),
              ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return LoginP();
                  }));
                },
                child: Text("or SignIN",style:TextStyle(fontSize: 15))
            ),
          ],
        ),
      ),
    );

  }
  Future signUp() async {
    try{
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
     UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
      );
      User? user = result.user;
      await DatabaseService(uid:user!.uid).updateUserData( unameController.text, phController.text,'Delhi','Kl00ZZ0000' );
    }
    on FirebaseAuthException catch (e){
      print(e.toString());
    }

  }
}



