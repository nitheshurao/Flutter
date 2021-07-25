import 'package:flutter/material.dart';
import 'package:my_app/Pages/Home_details_page.dart';
import 'package:my_app/model/cart.dart';
import 'package:my_app/model/catalog.dart';
import 'package:my_app/utils/them.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Catalog_Image.dart';
// import 'Home_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CaltelogModels.items.length,
      itemBuilder: (context, index) {
        final catalog = CaltelogModels.items[index]; //or
        // final catalog = CaltelogModels.getByPosition(index);

        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contexte) => HomeDetailPage(catalog: catalog))),
            // catalog: CaltelogModels.getById(2)))),//open itm ebased on Id
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
                image:
                    catalog.image)), //to animate ta page use hero in both page
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catalog.name.text.xl.color(context.accentColor).bold.make(),
            catalog.price.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 12), //padding only right side
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddtoCart(catalog: catalog)
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(100).make().py16();

    // )).white.rounded.square(100).make().py16();
  }
}

class _AddtoCart extends StatefulWidget {
  final Item catalog;
  const _AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  //add to cart

  @override
  __AddtoCartState createState() => __AddtoCartState();
}

class __AddtoCartState extends State<_AddtoCart> {
  bool isAdded = false;

  final _cart = CarModel();

  // _cart.add(Widget.catalog);
  @override
  Widget build(BuildContext context) {
    bool isinCart;
    if (_cart.items.contains(widget.catalog)) {
      isinCart = false;
    } else {
      isinCart = true;
    }
    return ElevatedButton(
        onPressed: () {
          if (!isinCart) {
            isAdded = isAdded.toggle();
            final _catalog = CaltelogModels();

            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(///////btn style
                // Mythemes.darkbluishcolor)),
                context.theme.buttonColor)),
        child: isAdded ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}
