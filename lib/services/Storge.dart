import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage fire = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  uploadImage(Uint8List file) async {
    String id = Uuid().v1(); //create a uniqe id
    Reference ref = fire
        .ref()
        .child('posts')
        .child(_auth.currentUser!.uid)
        .child(id); //create a ref

    UploadTask uploadTask = ref.putData(file);

    // now we need to create something to convert to link so we can store the data on firestore ,
    TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
