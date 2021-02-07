import 'package:flutter/cupertino.dart';

class QuakeBagModel {
  int id;
  String parentCategory;
  String category;
  String item;

  QuakeBagModel({@required this.id, @required this.parentCategory, @required this.category, @required this.item});

  QuakeBagModel.add({@required this.parentCategory, @required this.category, @required this.item});

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'ParentCategory': parentCategory,
      'Category': category,
      'Item': item,
    };
  }

  QuakeBagModel.fromMap(Map<String, dynamic> map)
      : id = map['ID'],
        parentCategory = map['ParentCategory'],
        category = map['Category'],
        item = map['Item'];

  @override
  String toString() {
    return 'QuakeBagModel{id: $id, parentCategory: $parentCategory, category: $category, item: $item}';
  }
}

class QuakeBagCategoryModel {
  String categoryName;
  int count;

  QuakeBagCategoryModel({@required this.categoryName, @required this.count});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'count': count,
    };
  }

  QuakeBagCategoryModel.fromMap(Map<String, dynamic> map)
      : categoryName = map['categoryName'],
        count = map['count'];

  @override
  String toString() {
    return 'QuakeBagCategoryModel{categoryName: $categoryName, count: $count}';
  }
}

class BagCategories {
  String categoryName;
  int requiredCount;
  int count;

  BagCategories({@required this.categoryName, @required this.requiredCount, @required this.count});
}

class BagItemCategories {
  String parentCategoryName;
  String categoryName;
  String itemName;

  BagItemCategories({@required this.parentCategoryName, @required this.categoryName, @required this.itemName});
}