// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/data/api/api_manager.dart';

import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_data_source.dart';

class HomeTabDataSourceImpl extends HomeTabRemoteDataSource {
  ApiManager apiManager;
  HomeTabDataSourceImpl({
    required this.apiManager,
  });
  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandsResponseEntity>>
      getAllBrands() async {
    var either = await apiManager.getAllBrands();

    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }
}
