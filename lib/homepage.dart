// ignore_for_file: prefer_const_constructors
import 'package:fireb_01/doc.dart';
import 'package:fireb_01/notif.dart';
import 'package:fireb_01/prof.dart';
import 'package:fireb_01/connect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fireb_01/Datab.dart';
import 'package:percent_indicator/percent_indicator.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: ListView(
          children: [
            DrawerHeader(child:Text("Vehicle Statistics",style:TextStyle(fontSize:25,color: Colors.yellow),)),
            CircularPercentIndicator(radius: 60.0,
                lineWidth: 5.0,
                percent: 0.8,
                center:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Acceleration",style: TextStyle(color: Colors.yellow),),
                  ],
                ),
                progressColor: Colors.red
            ),
            SizedBox(height: 40,),
            CircularPercentIndicator(radius: 60.0,
                lineWidth: 5.0,
                percent: 0.3,
                center:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Engine temp",style: TextStyle(color: Colors.yellow),),
                  ],
                ),
                progressColor: Colors.green
            ),
            SizedBox(height: 40,),

            CircularPercentIndicator(radius: 60.0,
                lineWidth: 5.0,
                percent: 0.5,
                center:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Mileage",style: TextStyle(color: Colors.yellow),),
                  ],
                ),
                progressColor: Colors.yellow
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title:  SizedBox(
          width: 90,
          height: 110,
          child: Image.asset("assets/Hero MotoCorp Limited Logo 2.jpg",height: 100,width: 60,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_active,
            ),
            iconSize: 30,
            color: Colors.red,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return NotifP();
            }));},
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            iconSize: 30,
            color: Colors.red,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return ProfP();
            }));},
          ),
          //Text(user.email!,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.red),),

          ],
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey,),
              child: Image.asset("assets/googl_ED.jpg")
            ),
            onTap: (){},
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,),
                      child: Image.asset("assets/Hero MotoCorp Limited Logo 2.jpg"),
                    ),
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ConnP();
                    }));},
                  ),
                  SizedBox(height: 10),
                  Text("Hero Connect")
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,),
                      child: Image.asset("assets/emeastro_360x240.jpg"),
                    ),
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return VehDocP();
                    }));},
                  ),
                  SizedBox(height: 10),
                  Text("Vehicle Documents")
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red,),
                    child: Image.asset("assets/hero-xtreme-160s_360x240.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text("Vehicle Updates")
                ],
              ),
            ],
          ),
          SizedBox(height: 100,),


        ],
      ),

    );
  }
  Future testp() async {
    try{
      User? user = FirebaseAuth.instance.currentUser;
       String nam= await DatabaseService(uid:user!.uid).getData();
      print(nam);
    }
    on FirebaseAuthException catch (e){
      print(e.toString());
    }

  }
}
