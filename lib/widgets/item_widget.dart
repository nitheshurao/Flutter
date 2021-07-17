import 'package:flutter/material.dart';
import 'package:my_app/model/catalog.dart';

class Itemwidget extends StatelessWidget {
  final Item item;

  const Itemwidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${item.name} is pressed");
        },
        // leading: Image.network(item.image),
        title: Text(item.name),
        trailing: Text("\$${item.price}",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
