import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smartdietapp/widgets/datamaincontainer.dart';

class DataScreen extends StatelessWidget {
  DataScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(children: [
        MainContaine(),
        MainContaine(),
        MainContaine(),
        MainContaine()
      ]),
    );
  }
}
