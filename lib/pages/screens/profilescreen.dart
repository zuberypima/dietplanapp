import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smartdietapp/models/bmiupdate.dart';
import 'package:smartdietapp/widgets/bodystatus.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';
import 'package:smartdietapp/widgets/profilecontaine.dart';


class ProfileScreem extends StatefulWidget {
  ProfileScreem({Key? key}) : super(key: key);

  @override
  State<ProfileScreem> createState() => _ProfileScreemState();
}

class _ProfileScreemState extends State<ProfileScreem> {
  // var weightbox = Hive.box('userweight');

  // var heightbox = Hive.box('userheight');

  // var _bmibox = Hive.box('userbmi');

  // var box = Hive.box('userage');

  // var _bodystatus = Hive.box('status');

  // var _goalWeight =Hive.box('gweight');

  String newweight='';

  @override
  Widget build(BuildContext context) {
    //var status = _bodystatus.get('Status').toString();

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileContaine(
                  textincontainer: 'Current BMI',
                  textindex:''
                  // _bmibox.get('Bmi').toString().trim(),
                ),
                ProfileContaine(
                  textincontainer: 'Current Weight',
                  textindex:''
                  // weightbox.get('Weight').toString(),
                )
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
                  textindex: ''
                  //_goalWeight.get('GoalWeight').toString(),
                )
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
                    'Body Status',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //  BodyStatusButton(text: 'Under', color:status=='under'? Colors.red:Colors.grey),
                 //   BodyStatusButton(
                   //   text: 'Nomal',
                    //  color:status=='Normal'? Colors.green:Colors.grey
                   // ),
                    // BodyStatusButton(
                    //   text: 'Over',
                    //   color:status=='Over'? Colors.yellow:Colors.grey
                    // ),
                    // BodyStatusButton(
                    //   text: 'Obesit',
                    //   color:status=='Obesit'? Colors.red:Colors.grey
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40, right: 30),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Basic Info',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '',
                       //   box.get('Age').toString(),
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '',
                         // weightbox.get('Weight').toString() + 'Kg',
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
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          '',
                       //   heightbox.get('Height').toString() + 'Ft',
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
                    onTap: (){
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
      ),
    );



  }

  updateButtonn(){
  return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      content: Container(
        height: 250,
        child: Column(
          
          children: [
             Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20,bottom: 30),
                    child: Text(
                      'Update your new info',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
            TextFormField(
              onChanged: ((value) {
setState(() {
newweight =value; 
});
              }),
              decoration: InputDecoration(
              
              hintText: 'New weight(kg) ',
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
            ),),
            SizedBox(height: 30,),
             TextFormField(decoration: InputDecoration(
              hintText: 'New Goal Weight(kg) ',
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
            ),)
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: InkWell(
            onTap: (){
              BIMUpdate().bmiUpdate(newweight);
            },
            child: NextButton('Submit')),
        )
      ],
    );
  });
}
}
