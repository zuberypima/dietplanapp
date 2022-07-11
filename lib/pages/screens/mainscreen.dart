import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smartdietapp/pages/screens/subscreens.dart/breakfastfood.dart';
import 'package:smartdietapp/pages/screens/subscreens.dart/dinnerfoods.dart';
import 'package:smartdietapp/pages/screens/subscreens.dart/lunchfoods.dart';
import 'package:smartdietapp/pages/screens/subscreens.dart/wakeupfood.dart';
import 'package:smartdietapp/subscreens/advicepage.dart';
import 'package:smartdietapp/subscreens/tipspage.dart';
import 'package:smartdietapp/subscreens/fooddetails.dart';
import 'package:smartdietapp/subscreens/workingsteps.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //Food Streems
  var teststream;
  final Stream<QuerySnapshot> normalfoods = FirebaseFirestore.instance
      .collection('NormalWeightData')
      .orderBy('position')
      .snapshots();
  final Stream<QuerySnapshot> underfoods = FirebaseFirestore.instance
      .collection('UnderWeightData')
      .orderBy('position')
      .snapshots();
  final Stream<QuerySnapshot> obersityfoods = FirebaseFirestore.instance
      .collection('OverWeightData')
      .orderBy('position')
      .snapshots();

  var _statusbox = Hive.box('StatusBox');
  @override
  Widget build(BuildContext context) {
    //check test
    var getstatus = _statusbox.get('Status');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Fri,20 May'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => AdvicesPage())));
                      },
                      child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.cyan,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text('advice on your diet'))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[100],
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text('Water'),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                value: 0.9,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.white,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('Diet Plan'),
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: CircularProgressIndicator(
                                  value: 0.9,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StepsRecordPage()));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('Steps'),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  value: 0.9,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => WakeupFoods())));
                        },
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Befor Breakfast',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => BreakfastFoods())));
                        },
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Breakfast',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    
                    ],
                  ),
                  SizedBox(height: 30,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => LunchFoods())));
                        },
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Lunch Time',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => DinnerFoods())));
                        },
                        child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Dinner Time',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    
                    ],
                  )
                ],
              ),
              // child: StreamBuilder<QuerySnapshot>(
              //   stream:getstatus=='Normal'?normalfoods:getstatus=='Under'?underfoods:obersityfoods,

              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return ListView(
              //       scrollDirection: Axis.horizontal,
              //       children:
              //           snapshot.data!.docs.map((DocumentSnapshot documents) {
              //         Map<String, dynamic> data =
              //             documents.data()! as Map<String, dynamic>;
              //         return Padding(
              //           padding: const EdgeInsets.only(left: 20, bottom: 20),
              //           child: Container(
              //             height: 250,
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(20)),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Text(
              //                     '${data['When']}',
              //                     style: TextStyle(fontSize: 20),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(10),
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         border: Border.all(
              //                             color: Colors.cyan, width: 2),
              //                         borderRadius: BorderRadius.circular(20)),
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Container(
              //                         width: MediaQuery.of(context).size.width /
              //                             1.4,
              //                         child: InkWell(
              //                           child: Row(
              //                             children: [
              //                               CircleAvatar(
              //                                 radius: 30,
              //                                 backgroundImage: NetworkImage(
              //                                     'https://media.istockphoto.com/photos/hydration-is-her-beauty-secret-picture-id658408448?b=1&k=20&m=658408448&s=170667a&w=0&h=NG-q9lSIlRbi0XivtmzD7UfSQMN9yQQroZi37d1iM7Y='),
              //                               ),
              //                               SizedBox(
              //                                 width: 5,
              //                               ),
              //                               Text(
              //                                 '${data['What']}',
              //                                 style: TextStyle(fontSize: 16),
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 // InkWell(
              //                 //   onTap: () {
              //                 //     Navigator.push(
              //                 //         context,
              //                 //         MaterialPageRoute(
              //                 //             builder: ((context) =>
              //                 //                 FoodDetails())));
              //                 //   },
              //                 //   child: Text(
              //                 //     'Add Food +',
              //                 //     style: TextStyle(
              //                 //         fontWeight: FontWeight.w600,
              //                 //         color: Colors.blue),
              //                 //   ),
              //                 // ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
