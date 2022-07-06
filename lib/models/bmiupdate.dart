import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BIMUpdate {
  var _weightbox = Hive.box('userweight');
  var _heightbox = Hive.box('userheight');
  var _bmibox = Hive.box('userbmi');
  var _bodystatus=Hive.box('status');
double heightM=0;
  double? bmi;

bmiUpdate(String newweight)async{
  final key ='Weight';
  final value =newweight;
  await _weightbox.put(key, value);
await bmiCalculator();
}

  bmiCalculator() async {
    double _weight = double.parse(_weightbox.get('Weight'));
    double _heightft = double.parse(_heightbox.get('Height'));
//change height in meter
heightM =double.parse((_heightft/3.2808).toStringAsFixed(0));
 
 
    bmi = (_weight) / (heightM * heightM);
    var collectbmi = double.parse(bmi.toString());
    if (bmi! <= 18.4){
      await _bodystatus.put('Status', 'under');
    }
    else if (bmi! >= 18.5 && bmi! <=24.9){
      await _bodystatus.put('Status', 'Normal');
    }
    else if (bmi! >= 25.0  && bmi! <=39.9	){
      await _bodystatus.put('Status', 'Over');
    }
    else{
      await _bodystatus.put('Status', 'Obesit');
    }

    await _bmibox.put('Bmi', collectbmi);
  }

  bmimeter(){
    
  }
}
