import 'dart:async';

import 'package:fireb_01/introd.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initstate(){
    super.initState();
    Timer(Duration(seconds: 1),(){ Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return OnBoardP();
    }));});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset("assets/—Pngtree—cute panda_643086.png"),
      ),
    );
  }
}
