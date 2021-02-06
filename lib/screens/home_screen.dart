

import 'package:flutter/material.dart';
import 'package:quake_flutter/screens/quake_bag.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.red,
          expandedHeight: 200,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Deprem App"),
            centerTitle: true,
          /*  background: Image.asset(
              "assets/images/image.jpg",
              fit: BoxFit.cover,
            ),*/
          ),
        ),



        //sabit elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(sabitListeElemanlari(context)),
        ),



      ],
    );
  }

  //listeler için tanımlanmış elemanları döndüren fonksiyon
  List<Widget> sabitListeElemanlari(BuildContext context) {
    return [
     _buildBagRequired(context),
      _buildLastQuakes(context),
      Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          "Sabit Liste Elemanı 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          "Sabit Liste Elemanı 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Text(
          "Sabit Liste Elemanı 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.cyan,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          "Sabit Liste Elemanı 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  _buildLastQuakes(BuildContext context){
    return       Container(
      height: 100,
      color: Colors.teal,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Text(
        "Son Depremler",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

_buildBagRequired(BuildContext context){
    return  /*InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => QuakeBag()
        ));
      },

      child:*/ Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        //decoration: kBoxDecorationStyle,
        child: Text(
          "Deprem Çantası",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      );
 //   );
}

}