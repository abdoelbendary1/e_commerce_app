import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/brands_response_entity/brand_response_entitiy.dart';
import 'package:e_commerce_app/domain/entities/category_response_entity/category_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandsResponseEntity>> getAllCategories();
   Future<Either<Failures,CategoryOrBrandsResponseEntity>> getAllBrands();
}
