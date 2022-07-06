import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  String text;
   NextButton(this.text,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,),
      child: Container(
                height: 45,
                  width: 400, 
                  decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(20)),
                   child: Center(child: Text('${text}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                  ),
    );
  }
}