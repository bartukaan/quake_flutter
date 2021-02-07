import 'package:flutter/material.dart';
import 'package:quake_flutter/models/quake_bag_model.dart';
import 'package:quake_flutter/screens/quake_bag_items_screen.dart';
import 'package:quake_flutter/utilities/constants.dart';

class QuakeBag extends StatefulWidget {
  @override
  _QuakeBagState createState() => _QuakeBagState();
}

class _QuakeBagState extends State<QuakeBag> {
  List<BagCategories> bagCategoriesList = [
    BagCategories(categoryName: "Gıda", requiredCount: 3, count: 0),
    BagCategories(categoryName: "Belge Fotokopileri", requiredCount: 10, count: 5),
    BagCategories(categoryName: "Giyecekler", requiredCount: 5, count: 2),
    BagCategories(categoryName: "Hijyen Malzemeleri", requiredCount: 10, count: 4),
    BagCategories(categoryName: "Diğer", requiredCount: 4, count: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deprem Çantam'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {

            var item = bagCategoriesList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  var itemSelectedList = bagItemList.where((element) => element.parentCategoryName == item.categoryName).toList();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuakeBagItems(itemsCategoryName: item.categoryName, itemList: itemSelectedList,)));
                },
                leading: Icon(Icons.arrow_forward_ios),
                title: Text(
                  item.categoryName,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _generateCountText(10, item.count),
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: _getTrailing(10, item.count),
              ),
            );
          },
          itemCount: bagCategoriesList.length,
        ),
        ),
    );
  }

  Widget _getTrailing(int requiredCount, int count) {
    if (count == 0) {
      return Icon(Icons.cancel, color: Colors.red,);
    } else if (count == requiredCount || count > requiredCount) {
      return Icon(Icons.check_circle, color: Colors.green,);
    } else {
      return Icon(Icons.cancel, color: Colors.red.shade100,);
    }
  }

  String _generateCountText(int requiredCount, int count) {
    if (requiredCount < count) {
      return count.toString() + ' / ' + count.toString();
    } else {
      return count.toString() + ' / ' + requiredCount.toString();
    }
  }
}
