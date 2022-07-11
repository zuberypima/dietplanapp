import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smartdietapp/models/bmiupdate.dart';
import 'package:smartdietapp/widgets/bodystatus.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';
import 'package:smartdietapp/widgets/profilecontaine.dart';

class ProfileScreem extends StatefulWidget {
  String username;
  ProfileScreem({Key? key, required this.username}) : super(key: key);

  @override
  State<ProfileScreem> createState() => _ProfileScreemState();
}

class _ProfileScreemState extends State<ProfileScreem> {
  String newweight = '';
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('UserDetails').snapshots();
  CollectionReference users =
      FirebaseFirestore.instance.collection('UserDetails');

    var _statusbox =Hive.box('StatusBox');
        var _bmibox =Hive.box('BMIBox');

  @override
  Widget build(BuildContext context) {
    //var bmivalue =_statusbox.get('Status');
       var bmi =_bmibox.get('BMI').toString();

    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc(widget.username).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileContaine(
                            textincontainer: 'Current BMI',
                            textindex: '${bmi}'),
                        ProfileContaine(
                            textincontainer: 'Current Weight',
                            textindex: '${data['Weight']}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileContaine(
                          textincontainer: 'Suggested Weight',
                          textindex: '55',
                        ),
                        ProfileContaine(
                            textincontainer: 'Goal Weight',
                            textindex: '${data['GoalWeight']}')
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                           // 'Body Status',
                           '${_statusbox.get('Status')}',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Divider(
                            thickness: 5,
                            color: Colors.black,
                          ),
                        ),
                        Row(children: [BodyStatusButton(
                      text: 'Under',
                      color:
                          _statusbox.get('Status') == 'Under' ? Colors.red : Colors.grey),
                  BodyStatusButton(
                      text: 'Nomal',
                      color: _statusbox.get('Status')== 'Normal'
                          ? Colors.green
                          : Colors.grey),
                  BodyStatusButton(
                      text: 'Over',
                      color:_statusbox.get('Status')== 'Over'
                          ? Colors.yellow
                          : Colors.grey),
                  BodyStatusButton(
                      text: 'Obesity',
                      color:_statusbox.get('Status')== 'Obesity'
                          ? Colors.red
                          : Colors.grey),],),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 40, right: 30),
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Basic Info',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Gender',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${data['Age']}',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monitor_weight,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Weigh',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${data['Weight']}',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.height,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Height',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${data['Height']}',
                                  style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap: () {
                                // print(_goalWeight.get('GoalWeight'));
                                // print( Hive.box('userweight').get('Weight').toString());
                                updateButtonn();
                              },
                              child: NextButton('Update')),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  updateButtonn() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 30),
                    child: Text(
                      'Update your new info',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  TextFormField(
                    onChanged: ((value) {
                      setState(() {
                        newweight = value;
                      });
                    }),
                    decoration: InputDecoration(
                        hintText: 'New weight(kg) ',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'New Goal Weight(kg) ',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                    onTap: () {
                      BIMUpdate().bmiUpdate(newweight);
                    },
                    child: NextButton('Submit')),
              )
            ],
          );
        });
  }
}

// BodyStatusButton(text: 'Under', color:status=='under'? Colors.red:Colors.grey),
//                BodyStatusButton(
//                  text: 'Nomal',
//                  color:status=='Normal'? Colors.green:Colors.grey
//                ),
//                 BodyStatusButton(
//                   text: 'Over',
//                   color:status=='Over'? Colors.yellow:Colors.grey
//                 ),
//                 BodyStatusButton(
//                   text: 'Obesit',
//                   color:status=='Obesit'? Colors.red:Colors.grey
//                 ),
