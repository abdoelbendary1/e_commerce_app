import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';

abstract class HomeTabRepository {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllBrands();
}
