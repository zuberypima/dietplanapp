import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserData {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

  adddata(String username, String age, String weight, String height) async {
    await ref.set({
      "Name": username,
      "Age": age,
      "Weight": weight,
      "Height": height,
    
    });
  }
 
}
