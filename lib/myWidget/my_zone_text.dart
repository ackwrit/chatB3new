import 'package:chatb3/fonction/firestore_helper.dart';
import 'package:chatb3/model/Profil.dart';
import 'package:flutter/material.dart';

class ZoneText extends StatefulWidget{
  Profil moi;
  Profil partenaire;
  ZoneText({required this.moi,required this.partenaire});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ZoneTextState();
  }
}

class ZoneTextState extends State<ZoneText>{
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration.collapsed(
                    hintText: "ecrivez votre message",
                ),
                maxLines: null,

              ),

          ),
          IconButton(icon: Icon(Icons.send),
            onPressed:sendBouttonMessage
          )
        ],
      )
    );
  }


  sendBouttonMessage(){
    if(textEditingController!=null&& textEditingController!=""){
      String text = textEditingController.text;
      Firestorehelper().sendMessage(text, widget.partenaire, widget.moi);
      setState(() {
        textEditingController.text='';
      });
    }

  }

}