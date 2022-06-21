import 'dart:io';
import 'package:fireb_01/homepage.dart';
import 'package:fireb_01/notif.dart';
import 'package:fireb_01/prof.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:file_picker/file_picker.dart';
import 'package:fireb_01/FileUpd.dart';
class VehDocP extends StatefulWidget {
  const VehDocP({Key? key}) : super(key: key);

  @override
  State<VehDocP> createState() => _VehDocPState();
}

class _VehDocPState extends State<VehDocP> {
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
    ],),
      body: const VehDocPP(),
    );
  }
}
class VehDocPP extends StatefulWidget {
  const VehDocPP({Key? key}) : super(key: key);

  @override
  State<VehDocPP> createState() => _VehDocPPState();
}

class _VehDocPPState extends State<VehDocPP> {
  File? file;
  //final filename = file != null? Path.basename(file!.path) : "No file selected";
  final snackBar = const SnackBar(content: Text('File Uploaded'));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellowAccent,
              ),
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            child:Column(
              children: [
                const Text('Registration Certificate',style:TextStyle(fontSize: 17,color: Colors.red),),
                Row(
                  children: [
                    ElevatedButton.icon(onPressed:selectFile , icon:const Icon(Icons.settings, size: 10),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                        onPrimary: Colors.white, // Text Color (Foreground color)
                      ),
                      label: const Text('Select File', style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton.icon(onPressed: uploadF , icon:const Icon(Icons.settings, size: 10),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                        onPrimary: Colors.white, // Text Color (Foreground color)
                      ),
                      label: const Text('Upload File', style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton.icon(onPressed:(){} , icon:const Icon(Icons.settings, size: 10),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                        onPrimary: Colors.white, // Text Color (Foreground color)
                      ),
                      label: const Text('View File', style: TextStyle(fontSize: 10),
                      ),
                    ),


                  ],
                )
              ],
            )
          ),
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellowAccent,
                ),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Column(
                children: [
                  const Text('Vehicle Insurance',style:TextStyle(fontSize: 17,color: Colors.red),),
                  Row(
                    children: [
                      ElevatedButton.icon(onPressed:selectFile , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('Select File', style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton.icon(onPressed: uploadF , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('Upload File', style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton.icon(onPressed:(){} , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('View File', style: TextStyle(fontSize: 10),
                        ),
                      ),


                    ],
                  )
                ],
              )
          ),
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellowAccent,
                ),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child:Column(
                children: [
                  const Text('Driving License',style:TextStyle(fontSize: 17,color: Colors.red),),
                  Row(
                    children: [
                      ElevatedButton.icon(onPressed:selectFile , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('Select File', style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton.icon(onPressed: uploadF , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('Upload File', style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton.icon(onPressed:(){} , icon:const Icon(Icons.settings, size: 10),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Background color
                          onPrimary: Colors.white, // Text Color (Foreground color)
                        ),
                        label: const Text('View File', style: TextStyle(fontSize: 10),
                        ),
                      ),


                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
  Future selectFile() async{
    final res = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(res == null) return;
    final path = res.files.single.path!;
    setState(() => file = File(path));

  }

  Future uploadF() async{
    if(file == null) return;
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    final filename = Path.basename(file!.path);
    final destination = 'vehdoc/$filename';

    FirebaseAp.uploadFile(destination , file!);



  }
}
