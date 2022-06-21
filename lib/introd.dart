// ignore_for_file: prefer_const_constructors
import 'package:fireb_01/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
 class OnBoardP extends StatelessWidget {
   const OnBoardP({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         body: OnBordPP(),
       ),
     );
   }
 }
class OnBordPP extends StatelessWidget {
  const OnBordPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "Track location,Record trips,Driving behaviour and more",
              body: "----------------------------------------------------",
              image: Image.asset("assets/Hero MotoCorp Limited Logo 2.jpg",height:200,width:300,)
          ),
          PageViewModel(
              title: "Record your bike with preinstalled GPS",
              body: "----------------------------------",
              image: Image.asset("assets/gps-tracker-motor-trackjack.jpg",height:200,width:200)
          ),
          PageViewModel(
              title: "Record your trip history",
              body: "-------------------------------",
              image: Image.asset("assets/emeastro_360x240.jpg",height:200,width:300)
          ),
          PageViewModel(
              title: "Get notified about speeding,vehicle tow & more",
              body: "---------------------------",
              image: Image.asset("assets/hero-xtreme-160s_360x240.jpg",height:200,width:300)
          ),
        ],
        showNextButton: true,
          showSkipButton: true,
        next: Text("Next"),
        skip: Text("Skip"),
        done: Text("Lets do this!"),
        onDone: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return LoginP();
          }));
        },
      ),
    );
  }
}
