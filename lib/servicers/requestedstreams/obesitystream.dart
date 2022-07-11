import 'package:cloud_firestore/cloud_firestore.dart';

class ObesityRequested{
 final Stream<QuerySnapshot> wekaup = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Wakeup')
      .collection('Obesity')
      .snapshots();

  final Stream<QuerySnapshot> morning = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Breakfast')
      .collection('Obesity')
      .snapshots();

      final Stream<QuerySnapshot> lunch = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('LunchFoods')
      .collection('Obesity')
      .snapshots();

      final Stream<QuerySnapshot> suppa = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('LunchFoods')
      .collection('Obesity')
      .snapshots();

      final Stream<QuerySnapshot> night = FirebaseFirestore.instance
      .collection('DeitPlanData')
      .doc('Night')
      .collection('Obesity')
      .snapshots();
}
