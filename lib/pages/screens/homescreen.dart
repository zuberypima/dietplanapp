import 'package:flutter/material.dart';
import 'package:smartdietapp/pages/screens/datascreen.dart';
import 'package:smartdietapp/pages/screens/mainscreen.dart';
import 'package:smartdietapp/pages/screens/profilescreen.dart';



class HomeScren extends StatefulWidget {
  const HomeScren({ Key? key }) : super(key: key);

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {

int _selectedpage=0;

final _pagesselected =[
   MainScreen(),
   DataScreen(),
   ProfileScreem()
];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.orange,
      //   automaticallyImplyLeading: false,
      //   title: Center(child: Text('Smart Diets')),),
        body: _pagesselected[_selectedpage],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedpage,
      onTap: (int index){
        setState(() {
          _selectedpage =index;
        });
      },
      items: [
      
      BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_tree_sharp,),label: 'Data'),
      BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'Profile'),

    ]),
    ),
    
    );
  }
}