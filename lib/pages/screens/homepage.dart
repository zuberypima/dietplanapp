import 'package:flutter/material.dart';
import 'package:smartdietapp/pages/screens/datascreen.dart';
import 'package:smartdietapp/pages/screens/mainscreen.dart';
import 'package:smartdietapp/pages/screens/profilescreen.dart';
import 'package:smartdietapp/servicers/notificationservice.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class HomeScren extends StatefulWidget {
  String username;
   HomeScren({ Key? key ,required this.username}) : super(key: key);

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {

int _selectedpage=0;
@override
  void initState() {
    // TODO: implement initState
      tz.initializeTimeZones();
    NotificationService().showNotification(1, 'Diet riminder', 'Please check your diet', 7);
  }

  @override
  Widget build(BuildContext context) {
    
final _pagesselected =[
   MainScreen(),
   DataScreen(),
   ProfileScreem(username: widget.username,)
];
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey,
              body: 
        _pagesselected[_selectedpage],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedpage,
      onTap: (int index){
        setState(() {
          _selectedpage =index;
        });
      },
      items: [
      
      BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_tree_sharp,),label: 'Tips'),
      BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'Profile'),

    ]),
    ),
    
    );
  }
}