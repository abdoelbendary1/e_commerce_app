// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/products_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/products_tab_repository.dart';

class ProductsTabRepositoryImpl extends ProductTabRepository {
  ProductsTabRemoteDataSource productsTabRemoteDataSource;
  ProductsTabRepositoryImpl({
    required this.productsTabRemoteDataSource,
  });
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return productsTabRemoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productID}) {
    return productsTabRemoteDataSource.addToCart(productID: productID);
  }
}
