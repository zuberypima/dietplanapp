import 'package:flutter/material.dart';

class FIrstForm extends StatefulWidget {
  const FIrstForm({ Key? key }) : super(key: key);

  @override
  State<FIrstForm> createState() => _FIrstFormState();
}

class _FIrstFormState extends State<FIrstForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: Container(
        height: 35,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          decoration: InputDecoration(
            
          ),
        ),
      ),
    );
  }
}