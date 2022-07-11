import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIMupdate {

String newWeght='';
  var _bodystatus = Hive.box('StatusBox');
  var _bmibox = Hive.box('BMIBox');
  CollectionReference users =
      FirebaseFirestore.instance.collection('UserDetails');

  double heightM = 0;
  double bmi=0;
  Future<String?>? bmicalculator(
   // String weight,
    String height,
  ) async {
    double _weight = double.parse(newWeght);
    double _heightft = double.parse(height);
//change height in meter
    heightM = double.parse(((_heightft * 0.3048)*(_heightft * 0.3048)).toStringAsFixed(3));

    bmi = _weight /heightM;
    var collectbmi = double.parse(bmi.toStringAsFixed(1));
    if (bmi <= 18.4) {
      await _bodystatus.put('Status', 'Under');
      await _bmibox.put('BMI',collectbmi);
      print(collectbmi);

    } else if (bmi >= 18.5 && bmi <= 24.9) {

      await _bodystatus.put('Status', 'Normal');
      await _bmibox.put('BMI', collectbmi);
       print(collectbmi);

    } else if (bmi >= 25.0 && bmi <= 30) {

      await _bodystatus.put('Status', 'Over');
      await _bmibox.put('BMI', collectbmi);
       print(collectbmi);
    } else {

      await _bodystatus.put('Status', 'Obesity');
      await _bmibox.put('BMI',collectbmi);
       print(collectbmi);
    }
    
  }

  Future<void> updateUserBMI(String docId) {
    return users
        .doc(docId)
        .update({'BMIvalue': 'test'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
