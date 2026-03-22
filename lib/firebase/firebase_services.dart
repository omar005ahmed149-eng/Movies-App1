import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class  FirebaseService {
  static Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
    static Future<void>addUserToFireStore(UserModel user){
      CollectionReference<UserModel> usersCollection =getUsersCollection();
      DocumentReference<UserModel> usersDocument = usersCollection.doc(user.id);
      return usersDocument.set(user);
    }

  static Future<UserModel> getUSerFromFIreStore(String uid) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> usersDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await usersDocument.get();
    UserModel user = documentSnapshot.data()!;
    return user;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromjson(snapshot.data()!, snapshot.id),
      toFirestore: (user, _) => user.tojson(),
    );
  }

}
