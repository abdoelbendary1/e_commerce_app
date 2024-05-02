import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';

abstract class ProductsTabRemoteDataSource {
  Future<Either<Failures, ProductResponseEntity>> getAllProducts();
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productID});
}
