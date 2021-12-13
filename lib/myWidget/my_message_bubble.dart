

import 'package:chatb3/model/Message.dart';
import 'package:chatb3/model/Profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget{
  Message message;
  Profil partenaire;
  String monId;
  Animation? animation;
  MessageBubble(@required this.message,@required this.partenaire,@required this.monId,{Animation? animation});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageBubbleState();
  }

}

class MessageBubbleState extends State<MessageBubble>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: widgetBubble(widget.message.from == widget.monId),
      ),
    );
  }


  List<Widget> widgetBubble(bool moi){
    CrossAxisAlignment alignement = moi?CrossAxisAlignment.end:CrossAxisAlignment.start;
    Color colorsBubble = moi? Colors.green: Colors.blue;
    Color textColor = Colors.white;

    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: alignement,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: colorsBubble,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(widget.message.texte,style: TextStyle(color: textColor),),
              ),
            )
          ],
        ),
      ),



    ];

}

}