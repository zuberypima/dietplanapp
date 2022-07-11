import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartdietapp/servicers/requestedstreams/normalstream.dart';
import 'package:smartdietapp/servicers/requestedstreams/obesitystream.dart';
import 'package:smartdietapp/servicers/requestedstreams/ovestrems.dart';
import 'package:smartdietapp/servicers/requestedstreams/understream.dart';

class SupperFoods extends StatefulWidget {
  const SupperFoods({ Key? key }) : super(key: key);

  @override
  State<SupperFoods> createState() => _SupperFoodsState();
}

class _SupperFoodsState extends State<SupperFoods> {
   var _statusbox = Hive.box('StatusBox');
  @override
  Widget build(BuildContext context) {
        var getstatus = _statusbox.get('Status');

    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,title: Text('Suppa Foods'),),
      body: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: getstatus == 'Normal'
                              ? NormalRequested().suppa
                              : getstatus == 'Over'
                                  ? OverRequested().suppa
                                  : getstatus == 'Under'
                                      ? UnderRequested().suppa
                                      : ObesityRequested().night,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Something went wrong'));
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                      //  updatefood('Wakeup','${data['Name']}');
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        title: Text('${data['Name']}'),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 3,
                                    )
                                  ],
                                );
                              }).toList(),
                            );
                          }),
                    ),
                  ),
                ),
              ]),);
  }
}