import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartdietapp/models/adduserdata.dart';
import 'package:smartdietapp/models/datatofirebase.dart';
import 'package:smartdietapp/pages/lifestyledetails.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';
import 'package:toggle_switch/toggle_switch.dart';

////Page for user to inter his or her height



class HeightPage extends StatefulWidget {
  String name;
  String age;
  String weight;
  HeightPage({Key? key,required this.name,required this.age,required this.weight}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int _heightvalue = 2;
  double _height = 1.0;

  String dislable = '';
  void addvalur() {
    setState(() {
      _heightvalue += 1;
    });
  }

  void subvalur() {
    setState(() {
      _heightvalue -= 1;
    });
  }

 // var box = Hive.box('username');
 // var box1 = Hive.box('userage');
 // var box2 = Hive.box('userweight');

  // final _nameuser = Hive.box('username').values.toString();
  // final _age = Hive.box('usedage').values.toString();
  // final _weight = Hive.box('userweight').values.toString();
  //String _username =UserInfomation().name;

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
              labels: ['Ft', 'M'],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'What is your Height (${dislable})',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
       
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  onChanged: (value) {
                    _height = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(20))),
                )),
          ),
          InkWell(
              onTap: () {
               // UserData().adddata(name, age, weight, _heightvalue.toString());
               AddUserData().userDetails(widget.name, widget.age,widget.weight,_height.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LifeStylePage()));
              },
              child: NextButton('Next'))
        ],
      )),
    );
  }
}
