import 'package:hive/hive.dart';

part 'purchase_item.g.dart';

@HiveType(typeId: 2)
class PurchaseDetails {
  @HiveField(0)
  String supplierName;

  @HiveField(1)
  int mobileNumber;

  @HiveField(2)
  String addressName;

  @HiveField(3)
  String productName;

  @HiveField(4)
  int purchaseRate;

  @HiveField(5)
  int quantityValue;

  @HiveField(6)
  int totalAmount;

  @HiveField(7)
  int sellingPrice;

  PurchaseDetails({
    required this.supplierName,
    required this.mobileNumber,
    required this.addressName,
    required this.productName,
    required this.purchaseRate,
    required this.quantityValue,
    required this.totalAmount,
    required this.sellingPrice,
  });
}
