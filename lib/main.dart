import 'package:fireb_01/introd.dart';
import 'package:fireb_01/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// ignore_for_file: prefer_const_constructors

  Future main() async {
    WidgetsFlutterBinding.ensureInitialized ();
    await Firebase.initializeApp();
    //FlutterNativeSplash.removeAfter(initialization);
  runApp( MyApp());
}
Future initialization(BuildContext? context) async{
    await Future.delayed(Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}

