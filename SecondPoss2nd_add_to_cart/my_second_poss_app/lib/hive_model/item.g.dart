// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemDetailsAdapter extends TypeAdapter<ItemDetails> {
  @override
  final int typeId = 1;

  @override
  ItemDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemDetails(
      address: fields[2] as String,
      customerName: fields[0] as String,
      mobile: fields[1] as int,
      product: fields[3] as String,
      quantity: fields[6] as int,
      salseRate: fields[5] as int,
      stock: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ItemDetails obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.customerName)
      ..writeByte(1)
      ..write(obj.mobile)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.product)
      ..writeByte(4)
      ..write(obj.stock)
      ..writeByte(5)
      ..write(obj.salseRate)
      ..writeByte(6)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
