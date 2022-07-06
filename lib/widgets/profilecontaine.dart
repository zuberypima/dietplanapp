import 'package:flutter/material.dart';

class ProfileContaine extends StatefulWidget {
  final String textincontainer;
  final String textindex;
  ProfileContaine({Key? key, required this.textincontainer,required this.textindex  }) : super(key: key);

  @override
  State<ProfileContaine> createState() => _ProfileContaineState();
}

class _ProfileContaineState extends State<ProfileContaine> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width/2.3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan,width: 2.5),
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('${widget.textincontainer}',style: TextStyle(fontSize: 16),),Text('${widget.textindex}',style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.w700),)],),
    );
  }
}
