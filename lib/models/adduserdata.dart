import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserData{
CollectionReference _userdetails =FirebaseFirestore.instance.collection('UserDetails');
  userDetails(String name,String  age,String weight,String height,String time,String goal){
    _userdetails.add({
      'Name':name,
      'Age':age,
      'Weight':weight,
      'Height':height,
      'WorkingTime':time,
      'GoalWeight':goal

    });
  }
}