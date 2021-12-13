
import 'package:chatb3/chatPage.dart';
import 'package:chatb3/fonction/firestore_helper.dart';
import 'package:chatb3/model/Profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';





class Parameter extends StatefulWidget{
  String identifiant;
  Parameter({required String this.identifiant});
  @override
  State<StatefulWidget> createState(){
    //TODO implement createState
    return ParameterState();
  }
}


class ParameterState extends State<Parameter> {
  Profil monCompteUtilisateur = Profil.vide();

  @override
  void initState() {
    super.initState();
    Firestorehelper().getProfil(widget.identifiant).then((value) {
      setState(() {
        monCompteUtilisateur = value;
      });
    });
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    print('verification');
    print(widget.identifiant);
    print(monCompteUtilisateur.uid);

    return Scaffold(


        body: bodyPage()
    );
  }


  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestorehelper().firestore_user.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        else {
          List documents = snapshot.data!.docs;
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, int index) {
                Profil user = Profil(documents[index]);
                if(user.uid != widget.identifiant){
                  return InkWell(
                    child: ListTile(
                      title: Text(user.name+" "+user.lastname),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context){
                              return chatPage(moi: monCompteUtilisateur, partenaire: user);
                            }
                        ));
                      },

                    ) ,
                  );
                }
                else
                  {
                    return Container();
                  }


                /* return ListTile(
                      title: Text(user.name),
                    );*/

              }
          );
        }
      },
    );
  }

}


/*
return ListTile(
                    title: Text(user.name),
                  );
 */