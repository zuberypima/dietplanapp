import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIM {
  // var _weightbox = Hive.box('userweight');
  // var _heightbox = Hive.box('userheight');
  // var _bmibox = Hive.box('userbmi');
  // var _bodystatus=Hive.box('status');
CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');
double heightM=0;
  double? bmi;
  bmicalculator(String weight,String height) async {
    double _weight = double.parse(weight);
    double _heightft = double.parse(height);
//change height in meter
heightM =double.parse((_heightft/3.2808).toStringAsFixed(0));
 
 
    bmi = (_weight) / (heightM * heightM);
    var collectbmi = double.parse(bmi.toString());
    if (bmi! <= 18.4){
    //  await _bodystatus.put('Status', 'under');
    }
    else if (bmi! >= 18.5 && bmi! <=24.9){
    //  await _bodystatus.put('Status', 'Normal');
    }
    else if (bmi! >= 25.0  && bmi! <=39.9	){
    //  await _bodystatus.put('Status', 'Over');
    }
    else{
    //  await _bodystatus.put('Status', 'Obesit');
    }

    //await _bmibox.put('Bmi', collectbmi);
    updateUserBMI();
  }

Future<void> updateUserBMI() {
  return users
    .doc('ABC123')
    .update({'Weight': 'Stokes and Sons'})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
}

}
