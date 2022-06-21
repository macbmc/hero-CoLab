// ignore_for_file: prefer_const_constructors
import 'package:fireb_01/homepage.dart';
import 'package:fireb_01/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
 class LoginP extends StatefulWidget {
   const LoginP({Key? key}) : super(key: key);
 
   @override
   State<LoginP> createState() => _LoginPState();
 }
 
 class _LoginPState extends State<LoginP> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       color: Colors.red,
       home: Scaffold(
         body: StreamBuilder<User?>(
           stream: FirebaseAuth.instance.authStateChanges(),
           builder: (context, snapshot){
            if (snapshot.hasData) {
              return HomePage();
         }
            else {
              return LoginPP();
            }
           },
         )
       ),
     );
   }
 }
 class LoginPP extends StatefulWidget {
   const LoginPP({Key? key}) : super(key: key);

   @override
   State<LoginPP> createState() => _LoginPPState();
 }
 
 class _LoginPPState extends State<LoginPP> {
   final emailController = TextEditingController();
   final passController = TextEditingController();
   final snackBar = SnackBar(content: Text('Long time no see..Welcome back'));
   @override
   void dispose() {
     emailController.dispose();
     passController.dispose();
     super.dispose();
   }
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor:Colors.white,
         elevation: 0,
         toolbarHeight: 5,
       ),
       body: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               padding: EdgeInsets.only(left: 10.0,right: 10.0),
               child: Image.asset("assets/Hero MotoCorp Limited Logo 2.jpg")
             ),
             SizedBox (height: 10),
         Text("SignIN",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:20 ),),
             SizedBox (height: 20),
         Container(
           padding: EdgeInsets.only(left: 20.0,right: 20.0),
           child: TextField(
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
         ),
         SizedBox (height: 10),
         Container(
           padding: EdgeInsets.only(left: 20.0,right: 20.0),
           child: TextField(
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
         ),
             SizedBox (height: 20),
            ElevatedButton.icon(onPressed: signIn , icon:Icon(Icons.lock_open, size: 20),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
                onPrimary: Colors.white, // Text Color (Foreground color)
              ),
              label: Text('Sign In', style: TextStyle(fontSize: 20),
            ),
            ),
             GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return Signup();
                   }));
                 },
                 child: Text(" or _Sign up_",style:TextStyle(fontSize: 15))
             ),
           ],
         ),
       ),
     );

   }
   Future signIn() async {
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
     UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: emailController.text.trim(),
       password:passController.text.trim(),
     );
   }
 }
 
 