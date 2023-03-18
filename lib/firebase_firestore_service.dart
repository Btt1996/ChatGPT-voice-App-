import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage(String message) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _db.collection('messages').add({
        'message': message,
        'userId': user.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return _db
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
 
