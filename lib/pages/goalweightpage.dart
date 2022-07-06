//Page for user to inter his or her weight

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smartdietapp/models/adduserdata.dart';
import 'package:smartdietapp/pages/screens/homescreen.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';

class GoalWeightPage extends StatelessWidget {
  String name;
  String age;
  String weight;
  String height;
  String workingtime;
  GoalWeightPage(
      {Key? key,
      required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.workingtime})
      : super(key: key);
  // var _goalweightbox = Hive.box('gweight');

  final TextEditingController _goalweight = TextEditingController();
  double? goalweight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
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
                    goalweight = double.parse(value);
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
          // FIrstForm(),
          InkWell(
              onTap: () async {
                // final key = 'GoalWeight';
                // final value = goalweight;
                //  await Hive.box('goalweight').put(key, value);
                //  await _goalweightbox.put(key, value).toString();
                await AddUserData().userDetails(name, age, weight,
                    height.toString(), workingtime, goalweight.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScren()));
              },
              child: NextButton('Submit'))
        ],
      )),
    );
  }
}
