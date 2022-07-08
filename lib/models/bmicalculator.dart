import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIM {
  // var _weightbox = Hive.box('userweight');
  // var _heightbox = Hive.box('userheight');
  // var _bmibox = Hive.box('userbmi');
  // var _bodystatus=Hive.box('status');
CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');
CollectionReference bodystatus = FirebaseFirestore.instance.collection('Bodystatus');

double heightM=0;
  double? bmi;
 Future<String?>? bmicalculator(String weight,String height,) async {
    double _weight = double.parse(weight);
    double _heightft = double.parse(height);
//change height in meter
heightM =double.parse((_heightft/3.2808).toStringAsFixed(0));
 
 
    bmi = (_weight) / (heightM * heightM);
    var collectbmi = double.parse(bmi.toString());
    if (bmi! <= 18.4){
    //  await _bodystatus.put('Status', 'under');
    bodystatus.doc('status').set({
      'Name':'under'
    });
    }
    else if (bmi! >= 18.5 && bmi! <=24.9){
    //  await _bodystatus.put('Status', '');
    bodystatus.doc('status').set({
      'Name':'Normal'
    });
    }
    else if (bmi! >= 25.0  && bmi! <=39.9	){
    //  await _bodystatus.put('Status', 'Over');
     bodystatus.doc('status').set({
      'Name':'Over'
    });
    }
    else{
    //  await _bodystatus.put('Status', 'Obesit');
     bodystatus.doc('status').set({
      'Name':'Obesit'
    });
    }
    //updateUserBMI(username);
    return bmi.toString();
  }

Future<void> updateUserBMI(String docId) {
  return users
    .doc(docId)
    .update({'BMIvalue': 'test'})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
}

}
