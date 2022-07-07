import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({ Key? key }) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('data'),),);
  }
}