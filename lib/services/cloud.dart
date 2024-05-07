import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/models/post.dart';
import 'package:social/services/Storge.dart';
import 'package:uuid/uuid.dart';

class cloudMethods {
// Reference to the 'posts' collection in Firestore

  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  uploadPost({
    required String description,
    required String uid,
    required String postId,
    String? profilePicture,
    required String username,
    required Uint8List file,
    required String displayName,
  }) async {
    // we need to bring the model so we can fill the info and send them to the firebase
    String res = 'some Error';
    try {
      String postId = Uuid().v1(); // it will create a uniqe user id ,
      String postimage =
          await StorageMethods().uploadImage(file); // get the url for the image
      PostModel postmodel = PostModel(
        uid: uid,
        displayName: displayName,
        username: username,
        profilePicture:
            profilePicture ?? '', // if there was no image reutrn it '' (empty)
        description: description,
        postId: postId,
        date: DateTime.now(),
        like: [], // when the post get posted it will have no likes
        postimage: postimage,
      );
      posts.doc(postId).set(postmodel
          .tojson()); // we use the instance so we can store a new doc in the firebase ,
      res = 'done';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
