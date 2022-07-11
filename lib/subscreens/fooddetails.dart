import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartdietapp/servicers/requestedstreams/normalstream.dart';
import 'package:smartdietapp/servicers/requestedstreams/obesitystream.dart';
import 'package:smartdietapp/servicers/requestedstreams/ovestrems.dart';
import 'package:smartdietapp/servicers/requestedstreams/understream.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final Stream<QuerySnapshot> _foodStream = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('LunchFoods')
      .collection('Proteinfoods')
      .snapshots();

  var _statusbox = Hive.box('StatusBox');
  @override
  Widget build(BuildContext context) {
    var getstatus = _statusbox.get('Status');
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.indigo,
              title: Text('Sugetsed Foods'),
              bottom: TabBar(
                indicatorColor: Colors.orange,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Wake up',
                    ),
                  ),
                  Tab(child: Text('Breakfast')),
                  Tab(child: Text('Lunch')),
                  Tab(child: Text('Supper')),
                  Tab(child: Text('Night')),
                ],
              )),
          body: TabBarView(
            children: [
              ListView(children: [
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
                              ? NormalRequested().wekaup
                              : getstatus == 'Over'
                                  ? OverRequested().wekaup
                                  : getstatus == 'Under'
                                      ? UnderRequested().wekaup
                                      : ObesityRequested().wekaup,
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
                                    ListTile(
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
              ]),

              //tab 2 Breakfast
              ListView(children: [
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
                              ? NormalRequested().morning
                              : getstatus == 'Over'
                                  ? OverRequested().morning
                                  : getstatus == 'Under'
                                      ? UnderRequested().morning
                                      : ObesityRequested().morning,
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
                                    ListTile(
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
              ]),

              //tab 3
              ListView(children: [
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
                              ? NormalRequested().lunch
                              : getstatus == 'Over'
                                  ? OverRequested().lunch
                                  : getstatus == 'Under'
                                      ? UnderRequested().lunch
                                      : ObesityRequested().lunch,
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
                                    ListTile(
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
              ]),

              //Tab4  for Supper
              ListView(children: [
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
                          stream:  getstatus == 'Normal'
                              ? NormalRequested().suppa
                              : getstatus == 'Over'
                                  ? OverRequested().suppa
                                  : getstatus == 'Under'
                                      ? UnderRequested().suppa
                                      : ObesityRequested().suppa,
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
                                    ListTile(
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
              ]),

              //Tab5
              ListView(children: [
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
                          stream:  getstatus == 'Normal'
                              ? NormalRequested().night
                              : getstatus == 'Over'
                                  ? OverRequested().night
                                  : getstatus == 'Under'
                                      ? UnderRequested().night
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
                                    ListTile(
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
              ]),
            ],
          )),
    );
  }
}
