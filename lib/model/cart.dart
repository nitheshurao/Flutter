import 'package:my_app/model/catalog.dart';
// import 'package:my_app/widgets/Home_widgets/Catalog_Header.dart';

class CarModel {
  //create singleton class to avoid crration of object every time
  static final cartModel = CarModel._internal();

  CarModel._internal();

  factory CarModel() => cartModel;

  //catalog filed
  late CaltelogModels _catalog;
//collection of files
//ude of_ is private
  final List<int> _itemIds = [];

  CaltelogModels get catalog => _catalog;

  set catalog(CaltelogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Item in the cart map the catalog Item based on id
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
