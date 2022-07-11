import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdvicesPage extends StatefulWidget {
  const AdvicesPage({Key? key}) : super(key: key);

  @override
  State<AdvicesPage> createState() => _AdvicesPageState();
}

class _AdvicesPageState extends State<AdvicesPage> {
  final Stream<QuerySnapshot> _underadvice =
      FirebaseFirestore.instance.collection('UnderAdvice').snapshots();
        final Stream<QuerySnapshot> _overadvice =
      FirebaseFirestore.instance.collection('OverAdvice').snapshots();
        final Stream<QuerySnapshot> _obersityadvice =
      FirebaseFirestore.instance.collection('ObersityAdvice').snapshots();
        final Stream<QuerySnapshot> _nomal =
      FirebaseFirestore.instance.collection('AdviceNormal').snapshots();
      var _statusbox =Hive.box('StatusBox');
  @override
  Widget build(BuildContext context) {
     var getstatus =_statusbox.get('Status');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getstatus=='Under'?_underadvice:getstatus=='Over'?_overadvice:getstatus=='Obesity'?_obersityadvice:_nomal,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 30,),
                child: Column(
                  children: [
                    Text(data['Title'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800),),
                    Divider(thickness: 3),
                     Text(data['Intro'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                           Divider(thickness: 3),
                    Text(data['Subtitle'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600)),
      Divider(thickness: 3),
                    Text(data['sub1'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                    SizedBox(height: 10,),
                    Text(data['sub2'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                       SizedBox(height: 10,),
                    Text(data['sub3'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                       SizedBox(height: 10,),
                    Text(data['sub4'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                       SizedBox(height: 10,),
                    Text(data['sub5'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                       SizedBox(height: 10,),
                       Divider(thickness: 3,),
                    Text(data['sub6'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800)),
                      Divider(thickness: 3,),
                    SizedBox(height: 10,),
                    Text(data['sub7'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400)),
                    SizedBox(height: 10,),
                   
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
