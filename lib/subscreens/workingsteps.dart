import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';



class StepsRecordPage extends StatefulWidget {
  const StepsRecordPage({ Key? key }) : super(key: key);

  @override
  State<StepsRecordPage> createState() => _StepsRecordPageState();
}

class _StepsRecordPageState extends State<StepsRecordPage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
void initState() {
    super.initState();
    initPlatformState();
  }
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {

    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
  
    setState(() {
      _status = 'Pedestrian Status not available';
    });
   
  }

  void onStepCountError(error) {
  
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  //steps calculator
  double goalsteps =100;
  double tekensteps=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,),
      body: Center(
          child: ListView(
          
            children: [
              SizedBox(height: 50,),
               Center(
                 child: Text(
                  'Steps taken today',
                  style: TextStyle(fontSize: 30,color: Colors.cyan),
              ),
              
               ),
               SizedBox(height: 20,),
               CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.white,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(_steps, style: TextStyle(fontSize: 30,color: Colors.cyan),),
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: CircularProgressIndicator(
                                  strokeWidth: 10,
                                  value: tekensteps,
                                  color: Colors.orange,
                                ),
                              )
                            ],
                          ),
                        ),
             SizedBox(height: 30,),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          )));
  }
}