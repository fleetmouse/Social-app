import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String uid;
  String displayName;
  String username;
  String profilePicture;
  String description;
  String postId;
  String postimage;
  DateTime date;
  dynamic like;

  PostModel({
    required this.uid,
    required this.displayName,
    required this.username,
    required this.profilePicture,
    required this.description,
    required this.postId,
    required this.date,
    required this.like,
    required this.postimage,
  });

  factory PostModel.fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PostModel(
      uid: snapshot['uid'],
      displayName: snapshot['displayName'],
      username: snapshot['username'],
      profilePicture: snapshot['profilePicture'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      date: (snapshot['date'] as Timestamp)
          .toDate(), // convert Timestamp to DateTime
      like: snapshot['like'],
      postimage: snapshot['postimage'],
    );
  }

  Map<String, dynamic> tojson() => {
        'uid': uid,
        'displayName': displayName,
        'username': username,
        'profilePicture': profilePicture,
        'description': description,
        'postId': postId,
        'date': Timestamp.fromDate(date), // convert DateTime to Timestamp
        'like': like,
        'postimage': postimage,
      };
}
