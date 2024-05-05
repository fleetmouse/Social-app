import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/models/user.dart';

class authFire {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  signUp({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) async {
    String res = 'something is wrong '; //.trim to remove tralling or spacing
    try {
      if (email.trim().isNotEmpty &&
          password.trim().isNotEmpty &&
          username.trim().isNotEmpty &&
          displayName.trim().isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          Email: email,
          displayName: displayName,
          Username: username,
          Bio: "",
          Profilepicture: "",
          Followers: [],
          Following: [],
        );
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userModel.tojson());
        res = 'correct ';
      } else {
        return 'enter all fields';
      }
    } on Exception catch (e) {
      print('fix the if in auth.dart');
      res = 'an error occurred: $e';
    }
    return res;
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    String res;
    try {
      if (email.trim().isNotEmpty && password.trim().isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'correct';
      } else {
        res = 'please enter the email and password';
      }
    } catch (e) {
      print(e);
      res = 'an error occurred: $e';
    }
    return res;
  }
}
