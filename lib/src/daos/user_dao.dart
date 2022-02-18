import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects3/src/models/user.dart';

class UserDao{
  static String colName = 'users';

    static CollectionReference _usersCollection =FirebaseFirestore.instance.collection(colName);
      static Future<UserMadel> getUser(String id) async {

      DocumentSnapshot doc =await  _usersCollection.doc(id).get();
      return UserMadel.fromDocumentSnapshot(doc);
  }

  static Future<void> saveUser( String uid,UserMadel user) async{
    await  _usersCollection.doc(uid).set(user.asMap());
  }
  static Future<void> deleteUser( String uid) async{
    await  _usersCollection.doc(uid).delete();
  }

   static Future<void> saveUser1(UserMadel user) async{
    await  _usersCollection.add(user.asMap());
  }
  
}