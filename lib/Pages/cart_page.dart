import 'package:flutter/material.dart';
import 'package:my_app/model/cart.dart';
// import 'package:my_app/utils/them.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Mythemes.creamColor,
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [Placeholder().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CarModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // "\$999".text.xl5.color(context.theme.accentColor).make(),
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          // TextButton(
          //   onPressed: () {},
          //   child: "Buy".text.color(context.theme.buttonColor).make(),
          // )
          ElevatedButton(
            onPressed: () {},
            // style: MaterialStateProperty.all<ButtonStyle>.backgroundColor(color),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class Cart_List extends StatefulWidget {
  const Cart_List({Key? key}) : super(key: key);

  @override
  _Cart_ListState createState() => _Cart_ListState();
}

class _Cart_ListState extends State<Cart_List> {
  final _cart = CarModel();
  @override
  Widget build(BuildContext context) {
    if (_cart.items.isEmpty) {
      return "Nothing to show ".text.makeCentered();
    } else {
      return ListView.builder(
        // itemCount: 5,
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buy not supported".text.make(),
              ));
            },
          ),
          // title: "Item 1".text.make(),
          title: _cart.items[index].name.text.make(),
        ),
      );
    }
  }
}
