import 'package:chatb3/fonction/firestore_helper.dart';
import 'package:chatb3/model/Message.dart';
import 'package:chatb3/model/Profil.dart';
import 'package:chatb3/myWidget/my_message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageController extends StatefulWidget{
  Profil moi;
  Profil partenaire;
  MessageController({required this.moi,required this.partenaire});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageControllerState();
  }

}

class MessageControllerState extends State<MessageController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return afficheMessage();
  }



  Widget afficheMessage(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestorehelper().firestore_message.orderBy("envoiMessage",descending: true).snapshots(),
        builder: (context,snapshot){
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }
        else
          {
            List doucments = snapshot.data!.docs;
            return ListView.builder(
              itemCount: doucments.length,
                itemBuilder: (context,index){
                Message discussion = Message(doucments[index]);
                if((discussion.from == widget.moi.uid && discussion.to == widget.partenaire.uid)||(discussion.from==widget.partenaire.uid && discussion.to==widget.moi.uid)){
                  return MessageBubble(discussion,widget.partenaire,widget.moi.uid);
                }
                else
                  {
                    return Container();
                  }
                }
            );
          }
        }
    );
  }

}