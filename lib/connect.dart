import 'package:fireb_01/homepage.dart';
import 'package:fireb_01/notif.dart';
import 'package:fireb_01/prof.dart';
import 'package:flutter/material.dart';
class ConnP extends StatefulWidget {
  const ConnP({Key? key}) : super(key: key);

  @override
  State<ConnP> createState() => _ConnPState();
}

class _ConnPState extends State<ConnP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 20,
          color: Colors.white,
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return const HomePage();
          }));},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active,
            ),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const NotifP();
            }));},
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const ProfP();
            }));},
          ),
        ],
      ),
      body: const ConnPP(),
    );
  }
}
class ConnPP extends StatefulWidget {
  const ConnPP({Key? key}) : super(key: key);

  @override
  State<ConnPP> createState() => _ConnPPState();
}

class _ConnPPState extends State<ConnPP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/connecthero.jpg"),
          const Text("oops!! Its lonely in here",style: TextStyle(color: Colors.red,fontSize: 30,fontStyle: FontStyle.italic),),
          const SizedBox(height: 40,),
          ElevatedButton.icon(onPressed: (){} , icon:const Icon(Icons.power_settings_new, size: 20),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Background color
              onPrimary: Colors.white, // Text Color (Foreground color)
            ),
            label: const Text('Activate', style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
