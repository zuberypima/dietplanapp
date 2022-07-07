import 'package:flutter/material.dart';
import 'package:smartdietapp/models/bmicalculator.dart';
import 'package:smartdietapp/pages/goalweightpage.dart';
import 'package:smartdietapp/widgets/firstform.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';

class WorkingHoursPage extends StatefulWidget {
  String name;
  String age;
  String weight;
  String height;
  WorkingHoursPage(
      {Key? key,
      required this.name,
      required this.age,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  State<WorkingHoursPage> createState() => _WorkingHoursPageState();
}

class _WorkingHoursPageState extends State<WorkingHoursPage> {
  String _workingtime='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'Your working hours /Day',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          // FIrstForm(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    onChanged: (value) {
_workingtime =value;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 4),
                            borderRadius: BorderRadius.circular(20))),
                  )),
            ),
          ),
          InkWell(
              onTap: () {
                //  BIM().bmicalculator();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GoalWeightPage(
                              name: widget.name,
                              age: widget.age,
                              weight: widget.weight,
                              height: widget.height,
                              workingtime: _workingtime,
                            )));
              },
              child: NextButton('Next'))
        ],
      )),
    );
  }
}
