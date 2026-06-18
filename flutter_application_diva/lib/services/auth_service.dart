import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(
      String nama,
      String email,
      String password) async {

    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'nama': nama,
      'email': email,
    });

    return userCredential.user;
  }

  Future login(
      String email,
      String password) async {

    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future logout() async {
    await _auth.signOut();
  }
}