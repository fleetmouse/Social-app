import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String Email;
  String displayName;
  String Username;
  String Bio;
  String Profilepicture;
  List Followers;
  List Following;

  UserModel({
    required this.uid,
    required this.Email,
    required this.displayName,
    required this.Username,
    required this.Bio,
    required this.Profilepicture,
    required this.Followers,
    required this.Following,
  });

  factory UserModel.fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String,
        dynamic>; // converts the document snapshot's data to a Map<String, dynamic>.
    return UserModel(
      uid: snapshot['uid'],
      Email: snapshot['Email'],
      displayName: snapshot['displayName'],
      Username: snapshot['Username'],
      Bio: snapshot['Bio'],
      Profilepicture: snapshot['Profilepicture'],
      Followers: snapshot['Followers'],
      Following: snapshot['Following'],
    );
  }

  // change the items to json
  Map<String, dynamic> tojson() => {
        'uid': uid,
        'Email': Email,
        'displayName': displayName,
        'Username': Username,
        'Bio': Bio,
        'Profilepicture': Profilepicture,
        'Followers': Followers,
        'Following': Following,
      };
}
