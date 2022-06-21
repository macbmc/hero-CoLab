// ignore_for_file: prefer_const_constructors
//import 'package:flutter/cupertino.dart';
import 'package:fireb_01/homepage.dart';
import 'package:fireb_01/setting.dart';
import 'package:fireb_01/update.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProfP extends StatelessWidget {
  const ProfP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return HomePage();
          }));},
        ),
        actions: [
          IconButton(onPressed: () => FirebaseAuth.instance.signOut(), icon: Icon(Icons.power_settings_new)),
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return SettP();
            }));},
          ),
        ],
      ),
      body: ProfPP(),
    );
  }
}
class ProfPP extends StatefulWidget {
  const ProfPP({Key? key}) : super(key: key);
  @override
  State<ProfPP> createState() => _ProfPPState();
}

class _ProfPPState extends State<ProfPP> {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  String? name;
   String? phno;
  String?  vno;
   String?  locn;
   String?  uid;
  String?  em;
  String?  nm;
  @override
  void initState(){
    super.initState();

    getData();
    setState(() {});

  }
  Future getData() async{
    User user = _auth.currentUser!;
    uid = user.uid;
    em = user.email!;
    final DocumentSnapshot userDoc =await FirebaseFirestore.instance.collection("users").doc(uid).get();
    name= userDoc.get("name");
    phno= userDoc.get("phoneno");
    locn= userDoc.get("location");
    vno= userDoc.get("vehicleno");
    print(name);
    print(phno);
    print(locn);
    print(vno);
  }
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  IconButton(onPressed: () {
                    print('hii');
                    print(name);
                    print(phno);
                    print(locn);
                    print(vno);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return UpdateP();
                        }));
                  }, icon: Icon(Icons.edit), iconSize: 30,),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                    ),
                    color: Colors.redAccent[700],
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("$name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text("$em", style: TextStyle(fontSize: 15,),),
              Text("$phno", style: TextStyle(fontSize: 15,),),
              Row(
                children: [
                  subelemento("Vehicle no", "$vno", Colors.white),
                  subelemento("Vehicle Model", "XTREME 160", Colors.white)
                ],
              ),
              Row(
                children: [
                  subelemento("Km Driven", "15000", Colors.white),
                  subelemento("Vehicle Location", "$locn", Colors.white)
                ],
              ),
              Container(width: 300, height: 1, color: Colors.black,),
              TextButton.icon(onPressed: () {},
                  icon: Icon(Icons.directions_bike, color: Colors.red,),
                  label: Text("Add Hero Connect",
                    style: TextStyle(fontSize: 17, color: Colors.orange),)),
              Container(width: 300, height: 1, color: Colors.black,),
              TextButton.icon(onPressed: () {},
                  icon: Icon(Icons.tag_faces_rounded, color: Colors.red),
                  label: Text("HERO Bot",
                    style: TextStyle(fontSize: 17, color: Colors.orange),)),
              Container(width: 300, height: 1, color: Colors.black,),
              TextButton.icon(onPressed: () {},
                  icon: Icon(Icons.mail_outline_rounded, color: Colors.red),
                  label: Text("Service Feedback",
                    style: TextStyle(fontSize: 17, color: Colors.orange),)),
              Container(width: 300, height: 1, color: Colors.black,),
              TextButton.icon(onPressed: () {},
                  icon: Icon(Icons.people_alt_sharp, color: Colors.red),
                  label: Text("Contacts",
                    style: TextStyle(fontSize: 17, color: Colors.orange),)),
              SizedBox(height: 80,)
            ],
          ),
        ),
      );

  }

  subelemento(String textdata,String userdata,Color _color){
    return Container(
      margin: EdgeInsets.all(20.0),
      width:  150,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        color: _color,
        borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
        children: [
          SizedBox(height: 10,),
          Text(textdata,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 17),),
          SizedBox(height: 10,),
          Container(width: 120,height: 1,color: Colors.black,),
          SizedBox(height: 15,),
          Text(userdata,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 17),),
        ],
      ),
    );
  }
}


