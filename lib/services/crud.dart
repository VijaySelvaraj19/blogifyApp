import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods {
  Future<void> addData(Map<String, dynamic> blogData) async {
    try {
      await FirebaseFirestore.instance.collection("blogs").add(blogData);
      print("Data added to Firestore successfully");
    } catch (e) {
      print("Failed to add data to Firestore: $e");
    }
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("blogs").snapshots();
  }

  Future<void> deleteBlog(String docId, String imgUrl) async {
    try {
    
      await FirebaseFirestore.instance.collection("blogs").doc(docId).delete();

    
      var storageRef = FirebaseStorage.instance.refFromURL(imgUrl);
      await storageRef.delete();

      print("Blog and associated image deleted successfully");
    } catch (e) {
      print("Failed to delete blog: $e");
    }
  }
}

