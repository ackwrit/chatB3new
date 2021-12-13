import 'package:chatb3/model/Profil.dart';
import 'package:chatb3/myWidget/my_zone_text.dart';
import 'package:flutter/material.dart';



class chatPage extends StatefulWidget{
  Profil moi;
  Profil partenaire;
  chatPage({required this.moi,required this.partenaire});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return chatPageState();
  }

}

class chatPageState extends State<chatPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat  B3'),
        centerTitle: true,
      ),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Column(
      children: [
        //Zone du chat
        new Flexible(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Text('Message changeant'),

          ),
        ),
        //Séparateur
        Divider(height: 1.5,),


        //Zone de text
        ZoneText(moi: widget.moi, partenaire: widget.partenaire)
      ],

    );
  }

}


