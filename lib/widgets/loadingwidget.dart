import 'package:flutter/material.dart';

class LoadingStatus extends StatelessWidget {
  const LoadingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
