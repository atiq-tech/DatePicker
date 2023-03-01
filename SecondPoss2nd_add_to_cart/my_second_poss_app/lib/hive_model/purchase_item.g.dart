// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseDetailsAdapter extends TypeAdapter<PurchaseDetails> {
  @override
  final int typeId = 2;

  @override
  PurchaseDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseDetails(
      supplierName: fields[0] as String,
      mobileNumber: fields[1] as int,
      addressName: fields[2] as String,
      productName: fields[3] as String,
      purchaseRate: fields[4] as int,
      quantityValue: fields[5] as int,
      totalAmount: fields[6] as int,
      sellingPrice: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.supplierName)
      ..writeByte(1)
      ..write(obj.mobileNumber)
      ..writeByte(2)
      ..write(obj.addressName)
      ..writeByte(3)
      ..write(obj.productName)
      ..writeByte(4)
      ..write(obj.purchaseRate)
      ..writeByte(5)
      ..write(obj.quantityValue)
      ..writeByte(6)
      ..write(obj.totalAmount)
      ..writeByte(7)
      ..write(obj.sellingPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
