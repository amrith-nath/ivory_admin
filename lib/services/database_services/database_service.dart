import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivory_admin/models/product_models.dart';

class DatabaseService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return fireStore.collection('products').snapshots().map(
          (snapshot) =>
              (snapshot.docs.map((doc) => Product.fromsnapshot(doc)).toList()),
        );
  }
}
