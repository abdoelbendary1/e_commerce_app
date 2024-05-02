import 'CartDataEntity.dart';

class GetCartDataResponseEntity {
  String? status;
  int? numOfCartItems;
  CartDataEntity? data;
  String? message;

  String? statusMsg;

  GetCartDataResponseEntity({
    this.status,
    this.numOfCartItems,
    this.data,
    this.message,
    this.statusMsg,
  });
}
