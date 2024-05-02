// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';
import 'package:e_commerce_app/domain/repository/data_source/products_remote_data_source.dart';

class ProductsTabRemoteDataSourceImpl extends ProductsTabRemoteDataSource {
  ApiManager apiManager;
  ProductsTabRemoteDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await apiManager.getAllProducts();
    return either.fold((l) => Left(l), (response) => right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      {required String productID}) async {
    var either = await apiManager.addToCart(productID);
    return either.fold((l) => left(l), (response) => right(response));
  }
}
