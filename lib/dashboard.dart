import 'package:chatb3/parameter.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget{
  String identifiant;
  dashboard({required String this.identifiant});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashboardState();
  }

}

class dashboardState extends State<dashboard>{
  int selectedIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat B3'),
        centerTitle: true,
      ),
      body: bodyPage(),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
            label: 'Utilisateurs'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ten_k),
              label: 'Profil'
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (currentSelected){
          setState(() {
            selectedIndex = currentSelected;
            controller.animateToPage(selectedIndex, duration: Duration(seconds: 1), curve: Curves.easeInOutExpo);

          });
        },

      ),
    );
  }


  //Page principal
Widget bodyPage(){
    return PageView(
      controller: controller,
      children: [
        Text("Profil") ,
        Parameter(identifiant:widget.identifiant)
      ],
      onPageChanged: (value){
        setState(() {
          selectedIndex =value;
        });

      },

    );
}

}