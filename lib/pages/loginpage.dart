import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartdietapp/pages/registrationpage.dart';
import 'package:smartdietapp/pages/screens/homepage.dart';
import 'package:smartdietapp/widgets/loadingwidget.dart';
import 'package:smartdietapp/widgets/nextbutton.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';

  String _password = '';

  final _auth = FirebaseAuth.instance;
bool isloading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'User name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              onChanged: ((value) {
                _username = value;
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
                _password = value;
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
              
              checkuserverificarion(_username, _password);
             
              },
              
              child:isloading?LoadingStatus()
    :NextButton('Login')),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
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
//Loading status

  
  checkuserverificarion(String uid, String password) {
    setState(() {
      isloading =true;
    });
    FirebaseFirestore.instance
        .collection('UserDetails')
        .where('Name', isEqualTo: uid)
        .where('Password', isEqualTo: password)
        .get()
        .then((QuerySnapshot snapshots) {
      if (snapshots.docs.isNotEmpty) {
        setState(() {
          isloading =false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomeScren(
                      username: uid,
                    )));
      }
      if (snapshots.docs.isEmpty) {
        setState(() {
        isloading =false;
      });
        return showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: AlertDialog(
                  content: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Hakikisha taaarifa ulizoweka',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
              );
            });
      }
      
    });
  }
}
