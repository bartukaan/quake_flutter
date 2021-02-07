import 'package:flutter/material.dart';
import 'package:quake_flutter/models/quake_bag_model.dart';

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.amber,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.purple,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kTextStyle = TextStyle(

);

final List<String> categoriesNames = [ 'Gıda', 'Belge Fotokopileri', 'Giyecekler', 'Hijyen Malzemeleri', 'Diğer' ];
final List<String> belgeFotokopileriCategories = ['Kimlik Kartları', 'Diplomalar', 'Pasaport, Banka Cüzdanı vb.', 'Diğer'];
List<BagItemCategories> bagItemList = [
  BagItemCategories(parentCategoryName: "Belge Fotokopileri", categoryName: "Kimlik Kartları", itemName: "Nüfus Cüzdanım"),
  BagItemCategories(parentCategoryName: "Belge Fotokopileri", categoryName: "Diplomalar", itemName: "Diplomam"),
  BagItemCategories(parentCategoryName: "Belge Fotokopileri", categoryName: "Pasaport, Banka Cüzdanı vb.", itemName: "Türkiye İş Bankası Cüzdanım"),
  BagItemCategories(parentCategoryName: "Belge Fotokopileri", categoryName: "Pasaport, Banka Cüzdanı vb.", itemName: "QNB Enpara Cüzdanım"),
  BagItemCategories(parentCategoryName: "Belge Fotokopileri", categoryName: "Diğer", itemName: "Köpeğimin Sağlık Karnesi"),
  BagItemCategories(parentCategoryName: "Giyecekler", categoryName: "Yağmurluk", itemName: "Yağmurluğum"),
  BagItemCategories(parentCategoryName: "Giyecekler", categoryName: "İklime Uygun Giysiler", itemName: "Kazağım"),
  BagItemCategories(parentCategoryName: "Hijyen Malzemeleri", categoryName: "Sabun ve Dezenfektanlar", itemName: "Katı Sabun"),
  BagItemCategories(parentCategoryName: "Hijyen Malzemeleri", categoryName: "Sabun ve Dezenfektanlar", itemName: "Dezenfektan"),
  BagItemCategories(parentCategoryName: "Hijyen Malzemeleri", categoryName: "Sabun ve Dezenfektanlar", itemName: "Diş Fırçam"),
  BagItemCategories(parentCategoryName: "Hijyen Malzemeleri", categoryName: "Sabun ve Dezenfektanlar", itemName: "Diş Macunum"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "İlk Yardım Çantası", itemName: "İlk Yardım Kiti"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "İlk Yardım Çantası", itemName: "İlaçlarım"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Uyku Tulumu ve Battaniye", itemName: "Uyku Tulumum"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Uyku Tulumu ve Battaniye", itemName: "Battaniyem"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Çakı, Düdük, Küçük Makas", itemName: "Düdük"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Çakı, Düdük, Küçük Makas", itemName: "Küçük Makas"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Kağıt, Kalem", itemName: "Kağıt"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Kağıt, Kalem", itemName: "Kalem"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Pil, El Feneri vb.", itemName: "Pil"),
  BagItemCategories(parentCategoryName: "Diğer", categoryName: "Pil, El Feneri vb.", itemName: "El Feneri"),
];