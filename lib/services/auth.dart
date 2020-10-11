import 'package:classroom/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      // AuthResult authResult = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // FirebaseUser firebaseUser = authResult.user;

      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      return _userFromFirebaseUser(firebaseUser);

    } catch (e) {
      print(e.toString());
    }
  }
}
