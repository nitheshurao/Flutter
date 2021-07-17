import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_app/model/catalog.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:my_app/widgets/item_widget.dart';
import 'dart:convert';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2)); // 2 sc dely displying loding
    var CatlogJson = await rootBundle.loadString("assets/Files/Catalog.json");
    var decodedData = jsonDecode(CatlogJson);
    // print(CatlogJson);
    var productdata = decodedData["products"];

    // List<Item> list =
    //     List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    CaltelogModels.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    print(decodedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CaltelogModels.items != null && CaltelogModels.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CaltelogModels.items[index];

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Image.network(item.image),
                      footer: Container(
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CaltelogModels.items.length,
              )
            : Center(
                // if not case
                child: CircularProgressIndicator(),
              ),
        // child: (CaltelogModels.items != null &&
        //         CaltelogModels.items
        //             .isNotEmpty) //cheking is emplty or not meen time showing looding
        //     ? ListView.builder(
        //         // try to use //grid view
        //         itemCount: CaltelogModels.items.length,
        //         itemBuilder: (context, index) {
        //           return Itemwidget(
        //             item: CaltelogModels.items[index],
        //           );
        //         },
        //       )
        //     : Center(
        //         // if not case
        //         child: CircularProgressIndicator(),
        //       ),
      ),
      drawer: MyDrawer(),
    );
  }
}
