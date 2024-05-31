import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  // get collection of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  //get customer information
  final CollectionReference customer = FirebaseFirestore.instance.collection('customer');


  // save order to database
Future<void> saveOrderToDatabase(String receipt) async{
  await orders.add({
    'date' : DateTime.now(),
    'order' : receipt,
  });
}

Future<void> saveCustomerInfo(String name, String mobile, String email) async{
  await customer.add({
    'name' : name,
    'mobile' : mobile,
    'email' : email,
  });
}

}