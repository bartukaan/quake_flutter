import 'package:flutter/material.dart';
import 'package:quake_flutter/models/quake_bag_model.dart';
import 'package:quake_flutter/utilities/constants.dart';

class QuakeBagItems extends StatefulWidget {
  String itemsCategoryName;
  List<BagItemCategories> itemList;

  QuakeBagItems({@required this.itemsCategoryName, @required this.itemList});

  @override
  _QuakeBagItemsState createState() => _QuakeBagItemsState();
}

class _QuakeBagItemsState extends State<QuakeBagItems> {

  String itemName;
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemsCategoryName),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            onPressed: () {
              _addItemDialog();
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {

            var item = widget.itemList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.arrow_forward_ios),
                title: Text(
                  item.itemName,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item.categoryName,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.redAccent,),
                  onPressed: () {

                  },
                ),
              ),
            );
          },
          itemCount: widget.itemList.length,
        ),
      ),
    );
  }

  void _addItemDialog() {
    var formKey = GlobalKey<FormState>();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.edit,
                size: 32,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Ekle",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        //initialValue: meterNo,
                        onSaved: (text) {
                          itemName = text;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Eşya adı giriniz.',
                          labelText: 'Eşya Adı *',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.speed,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: DropdownButtonFormField(
                        hint: Text('Kategori Seçiniz'),
                        value: selectedCategory,
                        items: belgeFotokopileriCategories.map((category) {
                          return DropdownMenuItem(child: Text(category), value: category,);
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'İPTAL',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.redAccent),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();

                              var itemModel = QuakeBagModel.add(parentCategory: widget.itemsCategoryName, category: selectedCategory, item: itemName);
                            }

                            // if (formKey.currentState.validate()) {
                            //   formKey.currentState.save();
                            //   /*    var newMeterTitle = (meterTitle.isEmpty)
                            //       ? "My Meter"
                            //       : meterTitle;*/
                            //
                            //   debugPrint(
                            //       "Meter Screen => Güncellenecek meter index: " +
                            //           position.toString());
                            //   debugPrint(
                            //       "Meter Screen => Güncellenecek meter no: " +
                            //           meterCardData[position]
                            //               .meterSerialNo
                            //               .toString());
                            //
                            //   _meterUpdateBloc.add(UpdateMeterEvent(
                            //       registrationID: meterCardData[position]
                            //           .registrationId
                            //           .toString(),
                            //       uuID: UserValues.currentUser.userUUID,
                            //       meterSerialNo: meterNo,
                            //       meterTitle: meterTitle));
                            // }
                          },
                          child: Text(
                            'KAYDET',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
