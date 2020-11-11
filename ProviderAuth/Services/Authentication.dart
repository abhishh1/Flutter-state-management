import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String email;
  String get getEmail {
    return email;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    assert(user.uid != null);
    email = user.email;
    print(email);
    notifyListeners();
    return user.uid == null ? null : user.uid;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    assert(user.uid != null);
    email = user.email;
    print(email);
    notifyListeners();
    return user.uid == null ? null : user.uid;
  }
}
