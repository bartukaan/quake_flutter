import 'package:flutter/material.dart';
import 'package:quake_flutter/screens/building_status_screen.dart';
import 'package:quake_flutter/screens/last_quakes_screen.dart';
import 'package:quake_flutter/screens/quake_bag_screen.dart';
import 'package:quake_flutter/utilities/constants.dart';

import 'afet_toplanma_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Depreme Hazırım',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              background: Image.asset(
                'assets/earthquakehome.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          //sabit elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate(sabitListeElemanlari(context)),
          ),
        ],
      ),
    );
  }

  //listeler için tanımlanmış elemanları döndüren fonksiyon
  List<Widget> sabitListeElemanlari(BuildContext context) {
    return [
      _buildBagRequired(context),
      _buildLastQuakes(context),
      _buildBuildingStatus(context),
      _buildAfetToplanma(context),
      // Container(
      //   height: 100,
      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.purple),
      //   alignment: Alignment.center,
      //   margin: EdgeInsets.all(10),
      //   padding: EdgeInsets.all(10),
      //   child: Text(
      //     "Sabit Liste Elemanı 5",
      //     style: TextStyle(fontSize: 18),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      // Container(
      //   height: 100,
      //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.cyan),
      //   margin: EdgeInsets.all(10),
      //   padding: EdgeInsets.all(10),
      //   alignment: Alignment.center,
      //   child: Text(
      //     "Sabit Liste Elemanı 6",
      //     style: TextStyle(fontSize: 18),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    ];
  }

   _buildAfetToplanma(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AfetToplanma()));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.supervised_user_circle_sharp,
              color: Colors.white,
              size: 64,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Afet Toplanma",
              style: _gridTextStyle(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

   _buildBuildingStatus(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BuildingStatus()));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 64,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bina Durumu",
              style: _gridTextStyle(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  _buildLastQuakes(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LastQuakes()));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.redAccent),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 64,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Son Depremler",
              style: _gridTextStyle(),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  _buildBagRequired(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuakeBag()));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
              size: 64,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Deprem Çantası",
              style: _gridTextStyle(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _gridTextStyle() => TextStyle(
        fontSize: 24,
        letterSpacing: 3,
        color: Colors.white,
      );
}
