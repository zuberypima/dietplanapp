import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIMupdate {

//String newWeght='';
  var _bodystatus = Hive.box('StatusBox');
  var _bmibox = Hive.box('BMIBox');
  var _heightbox = Hive.box('HeightBox');
  CollectionReference users =
      FirebaseFirestore.instance.collection('UserDetails');

  double heightM = 0;
  double bmi=0;
  Future<String?>? bmicalculator(
   
   String weight,
  
   
  ) async {
    
     String height =_heightbox.get('Height');
    double _weight = double.parse(weight);
    double _heightft = double.parse(height);
//change height in meter
    heightM = double.parse(((_heightft * 0.3048)*(_heightft * 0.3048)).toStringAsFixed(3));

    bmi = _weight /heightM;
    var collectbmi = double.parse(bmi.toStringAsFixed(1));
    if (bmi <= 18.4) {
      await _bodystatus.put('Status', 'Under');
      await _bmibox.put('BMI',collectbmi);
    } else if (bmi >= 18.5 && bmi <= 24.9) {

      await _bodystatus.put('Status', 'Normal');
      await _bmibox.put('BMI', collectbmi);
       

    } else if (bmi >= 25.0 && bmi <= 30) {

      await _bodystatus.put('Status', 'Over');
      await _bmibox.put('BMI', collectbmi);
       
    } else {

      await _bodystatus.put('Status', 'Obesity');
      await _bmibox.put('BMI',collectbmi);
  
    }
    
  }

  Future<void> updateUserBMI(String docId,String newWeight,) {
    return users
        .doc(docId)
        .update({'BMIvalue': 'test','Weight':newWeight})
        
        .then((value) => print("User Updated"));
  }
}
