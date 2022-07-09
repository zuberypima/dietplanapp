//Page for user to inter his or her weight
import 'package:flutter/material.dart';
import 'package:smartdietapp/pages/heightpage.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';
import 'package:toggle_switch/toggle_switch.dart';

class WeightPage extends StatefulWidget {
  String name;
  String age;
  String email;
  String pasword;
  WeightPage({Key? key, required this.name, required this.age,required this.email,required this.pasword})
      : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  String weight ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ToggleSwitch(
                minWidth: 70.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.cyan],
                  [Colors.cyan]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.black,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: ['Kg', 'Pound'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            Text(
              'What is your weight(kg)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    onChanged: (value) {
                    weight =value;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 4),
                            borderRadius: BorderRadius.circular(20))),
                  )),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HeightPage(
                                name: widget.name,
                                age: widget.age,
                                weight: weight,
                                email: widget.email,
                                password: widget.pasword,
                              )));
                },
                child: NextButton('Next'))
          ],
        ),
      ),
    );
  }
}
