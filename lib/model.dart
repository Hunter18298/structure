import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Model {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  Model({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  factory Model.fromMap(Map<String, dynamic> snapshot) {
    return Model(
        id: snapshot['id'],
        name: snapshot['name'],
        description: snapshot['description'],
        imageUrl: snapshot['imageUrl']);
  }
}

class Category with ChangeNotifier {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}

class CoffeData with ChangeNotifier {
  List<Model> category = [
    Model(
        id: '1', name: 'name', description: 'description', imageUrl: 'imageUrl')
  ];

  List<Model> get getcategory {
    return category;
  }

  CoffeData(this.category);
  fetchData(String docid) {
    final firebase = FirebaseFirestore.instance
        .collection('/coffe/esbZ0ERJcNrk2LALGTjo/seasonal');
    final docs = firebase.doc(docid).snapshots();
    final data = docs as Map<String, dynamic>;

    category.add(Model.fromMap(data));
  }
  // Model FindById(String id) {
  //   return category.firstWhere((prod) => prod.id == id);
  // }
}
