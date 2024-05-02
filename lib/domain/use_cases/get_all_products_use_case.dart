// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';

import 'package:e_commerce_app/domain/repository/repository/products_tab_repository.dart';

class GetAllProductsUseCase {
  ProductTabRepository productTabRepository;
  GetAllProductsUseCase({
    required this.productTabRepository,
  });

  Future<Either<Failures, ProductResponseEntity>> invoke() async {
    return await productTabRepository.getAllProducts();
  }
}
