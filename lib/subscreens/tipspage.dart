import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final Stream<QuerySnapshot> _sugestedfoodStream =
      FirebaseFirestore.instance.collection('UnderAdvice').orderBy('Pos').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _sugestedfoodStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 30,bottom: 30),
                child: Container(
                 height: MediaQuery.of(context).size.height/2,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(color:Colors.lightGreen[200],borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: ListTile(
                      title: Text(data['Doc'],style:TextStyle(color: Colors.white,fontSize: 18),),
                    
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
