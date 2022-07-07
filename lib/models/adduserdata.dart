import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartdietapp/models/bmicalculator.dart';

class AddUserData{
CollectionReference _userdetails =FirebaseFirestore.instance.collection('UserDetails');
  userDetails(String name,String  age,String weight,String height,String time,String goal)async{
    String bmivalue;
       bmivalue=await BIM().bmicalculator(weight,height) as String;
    _userdetails.doc(name).set({
      'Name':name,
      'Age':age,
      'Weight':weight,
      'Height':height,
      'WorkingTime':time,
      'GoalWeight':goal,
      'BMIvalue':bmivalue,

    });
  }
}