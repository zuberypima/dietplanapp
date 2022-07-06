import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartdietapp/pages/homepage.dart';
import 'package:smartdietapp/pages/registrationpage.dart';
import 'package:smartdietapp/pages/screens/homescreen.dart';
import 'package:smartdietapp/pages/usedetailspage.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  String? _email;
  String? _password;

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Email Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              onChanged: ((value) {
                _email = value.trim();
              }),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 20),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: TextFormField(
              onChanged: ((value) {
                _password = value.trim();
              }),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          InkWell(
              onTap: () async {
                try{
                    await _auth.signInWithEmailAndPassword(email: _email!, password: _password!).then((value) {
                       Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureBuilder(
                      future: Hive.openBox('username').then((value) async{
                      await Hive.openBox('userage')
                            .then((value) {
                              Hive.openBox("userweight");
                            })
                            .then((value) => Hive.openBox("userheight"))
                            .then((value) => Hive.openBox('userbmi'))
                            .then((value) => Hive.openBox('goalweight'));
                      }),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return HomeScren();
                      },
                    ),
                  ),
                );
                    });
                }on FirebaseAuthException catch(e){
                  print('check the password');
                }
                catch(e){
                  print('Error');
                }
              
               
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PageOne()));
            
              },
              child: NextButton('Login')),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetailsPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I do not have an account"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      //color: Colors.white,
                      child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
