import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIM {
  // var _weightbox = Hive.box('userweight');
  // var _heightbox = Hive.box('userheight');
  
   //var _bmibox = Hive.box('userbmi');
   var _bodystatus=Hive.box('StatusBox');
    var _bmibox=Hive.box('BMIBox');
CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');

double heightM=0;
  double? bmi;
 Future<String?>? bmicalculator(String weight,String height,String docid) async {
    double _weight = double.parse(weight);
    double _heightft = double.parse(height);
//change height in meter
heightM =double.parse((_heightft/3.2808).toStringAsFixed(0));
 
 
    bmi = (_weight) / (heightM * heightM);
    var collectbmi = double.parse(bmi.toString());
    if (bmi! <= 18.4){
      await _bodystatus.put('Status', 'Under');
      await _bmibox.put('BMI', bmi.toString());
  //  users.doc(docid).update({'Status':'Under'});
    }
    else if (bmi! >= 18.5 && bmi! <=24.9){
    //  await _bodystatus.put('Status', '');
   
 await _bodystatus.put('Status', 'Normal');
     //   users.doc(docid).update({'Status':'Normal'});
  await _bmibox.put('BMI', bmi.toString());
    }
    else if (bmi! >= 25.0  && bmi! <=39.9	){
    //  await _bodystatus.put('Status', 'Over');
    
     await _bodystatus.put('Status', 'Over');
       await _bmibox.put('BMI', bmi.toString());
    //        users.doc(docid).update({'Status':'Over'});

    }
    else{
    //  await _bodystatus.put('Status', 'Obesit');
   
     await _bodystatus.put('Status', 'Obersity');
       await _bmibox.put('BMI', bmi.toString());
      //  users.doc(docid).update({'Status':'Over'});
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
