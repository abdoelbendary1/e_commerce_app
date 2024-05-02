import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';

import 'CartProductEntity.dart';

class GetCartProductEntity {
  int? count;
  String? id;
  ProductEntity? product;
  int? price;

  GetCartProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}
