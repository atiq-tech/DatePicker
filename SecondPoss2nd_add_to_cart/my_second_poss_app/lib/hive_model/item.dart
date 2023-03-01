import 'package:hive/hive.dart';

part 'item.g.dart';

// part a file er name dite hobe, class er name na, jemon ei dart file tar name item.dart
//porer ta purchase_item.dart


@HiveType(typeId: 1)
class ItemDetails {
  @HiveField(0)
  String customerName;

  @HiveField(1)
  int mobile;

  @HiveField(2)
  String address;

  @HiveField(3)
  String product;

  @HiveField(4)
  int stock;

  @HiveField(5)
  int salseRate;

  @HiveField(6)
  int quantity;

  ItemDetails(
      {required this.address,
      required this.customerName,
      required this.mobile,
      required this.product,
      required this.quantity,
      required this.salseRate,
      required this.stock});
}
