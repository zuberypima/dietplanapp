import 'package:flutter/material.dart';
import 'package:smartdietapp/models/bmicalculator.dart';
import 'package:smartdietapp/pages/goalweightpage.dart';
import 'package:smartdietapp/widgets/firstform.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';

class LifeStylePage extends StatelessWidget {
  const LifeStylePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Your working hours /Day',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          // FIrstForm(),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
            ),
          ),
          InkWell(
              onTap: () {
                BIM().bmicalculator();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GoalWeightPage()));
              },
              child: NextButton('Next'))
        ],
      )),
    );
  }
}
