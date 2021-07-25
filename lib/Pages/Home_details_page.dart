import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/catalog.dart';
import 'package:my_app/utils/them.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Mythemes.creamColor,
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(right: 12), //padding only right side
        children: [
          "\$${catalog.price}".text.bold.xl4.red500.make(),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(///////btn style
                      // Mythemes.darkbluishcolor)),
                      context.theme.buttonColor)),
              child: "Add to Cart .".text.make())
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //to animate page chnage use hero and tag
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .p32(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  // color: Colors.red,
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [catalog.name.text.make()],
                  ),
                ),
              ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
