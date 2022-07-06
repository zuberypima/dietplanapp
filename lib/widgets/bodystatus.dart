import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BodyStatusButton extends StatefulWidget {
  String text;
  Color color;
   BodyStatusButton({Key? key,required this.text,required this.color}) : super(key: key);

  @override
  State<BodyStatusButton> createState() => _BodyStatusButtonState();
}

class _BodyStatusButtonState extends State<BodyStatusButton> {
  var _bmibox = Hive.box('userbmi');

  @override
  Widget build(BuildContext context) {
       
 var status = _bmibox.get('Bmi').toString();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            
            ),
        child: Center(
            child: Text(
          '${widget.text}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
