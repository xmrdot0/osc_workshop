import 'package:firebase_auth/firebase_auth.dart';
import 'package:osc_workshop/day_6/Facebook/services/UserData.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future SignIn(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserData.username = res.user!.email as String;
      //UserData.username=email;
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }

  Future SignUp(String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserData.username = email;
      return true;
    } catch (e) {
      return false;
    }
  }
}
