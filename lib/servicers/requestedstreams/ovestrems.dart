import 'package:cloud_firestore/cloud_firestore.dart';

class OverRequested{
 final Stream<QuerySnapshot> wekaup = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Wakeup')
      .collection('Over')
      .snapshots();

  final Stream<QuerySnapshot> morning = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Breakfast')
      .collection('Over')
      .snapshots();

      final Stream<QuerySnapshot> lunch = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('LunchFoods')
      .collection('Over')
      .snapshots();

      final Stream<QuerySnapshot> suppa = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('LunchFoods')
      .collection('Over')
      .snapshots();

      final Stream<QuerySnapshot> night = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Night')
      .collection('Over')
      .snapshots();
}
