
import 'package:chatb3/model/Profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation{
  late String idConversation;
  late String idMoi;
  late String lastMessage;
  Profil user = Profil.vide();
  late String destinateur;

  Conversation(DocumentSnapshot snapshot){
    idConversation = snapshot.id;
    Map <String,dynamic> map = snapshot.data() as Map <String,dynamic>;
    lastMessage = map['lastMessage'];
    idMoi = map['idMoi'];
    user = Profil(snapshot);
    destinateur = user.uid;
  }

}