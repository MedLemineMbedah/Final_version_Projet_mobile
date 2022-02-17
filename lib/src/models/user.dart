
import 'package:cloud_firestore/cloud_firestore.dart';
class UserMadel{
  String id;
  String nom;
  String  prenom;
  String  email;
  bool isAdmin;
  
  bool estOcupper;
  

  UserMadel({required this.nom,required this.prenom,required this.email, this.isAdmin = false, this.id = '',this.estOcupper= false});

  Map<String ,dynamic> asMap(){
    return {
    'nom': nom,
    "prenom" : prenom,
    'email' : email,
    'isAdmin' : isAdmin,
    'estOcupper' :false

    };
  }

  static UserMadel fromMap(Map<String,dynamic > data , String idP){
    return  UserMadel(
      id : idP,
      nom:  data['nom'] ?? '' ,
       prenom: data['prenom'] ?? '',
       email: data['email']  ?? '',
       isAdmin: data['isAdmin']  ?? false,
      estOcupper: data['estOcupper']  ?? false,
        );
  }

  static UserMadel fromDocumentSnapshot(DocumentSnapshot doc){
    return fromMap(doc.data() as Map<String ,dynamic>, doc.id);
  }

}