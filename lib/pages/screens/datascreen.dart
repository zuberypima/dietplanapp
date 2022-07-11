import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smartdietapp/widgets/datamaincontainer.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final Stream<QuerySnapshot> _gainStream =
      FirebaseFirestore.instance.collection('TipsTogain').orderBy('possition').snapshots();
   final Stream<QuerySnapshot> _toloseStream =
      FirebaseFirestore.instance.collection('tipsToloss').orderBy('possition').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange[200],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                'Tips to Gain your Weight',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              )),
            ),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _gainStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Text(data['Name'], style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                     textAlign: TextAlign.center,
                                    ),
                            )
                                  )),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Tips to Lose your Weight',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            )),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _toloseStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Text(
                                    
                              data['Name'],
                              style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                      textAlign: TextAlign.center,
                            ),
                                ),
                            )),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
