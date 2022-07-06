// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';


// class TemporariStore{
//   List<Box> boxList = [];

//   Future<List<Box>> _openBox() async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive.init(dir.path);
//     var box_name = await Hive.openBox('username');
//     var box_age = await Hive.openBox("usedage");
//     var box_weight = await Hive.openBox("userweight");
//     var box_height = await Hive.openBox("userheight");

//     // boxList.add(box_name);
//     // boxList.add(box_age);
//     // boxList.add(box_weight);
//     // boxList.add(box_height);

//     return boxList;
//   }
// }