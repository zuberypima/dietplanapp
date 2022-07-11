//Page for user to inter his or her weight

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smartdietapp/models/adduserdata.dart';
import 'package:smartdietapp/models/bmicalculator.dart';
import 'package:smartdietapp/pages/screens/homepage.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';

class GoalWeightPage extends StatelessWidget {
  String name;
  String age;
  String weight;
  String height;
  String workingtime;
  String email;
  String password;
  GoalWeightPage(
      {Key? key,
      required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.workingtime,
      required this.email,
      required this.password
      })
      : super(key: key);

  final TextEditingController _goalweight = TextEditingController();
  String goalweight ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'What is your  Goal weight(kg)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  onChanged: (value) {
                    goalweight = value;
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(20))),
                )),
          ),
          InkWell(
              onTap: () async {
                await AddUserData().userDetails(name, age,weight,
                    height, workingtime, goalweight.toString(),email,password);
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScren(username: name,)));
           
              },
              child: NextButton('Submit'))
        ],
      )),
    );
  }
}
