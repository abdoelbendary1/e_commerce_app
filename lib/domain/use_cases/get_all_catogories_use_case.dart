// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

class GetAllCategoryUseCase {
  HomeTabRepository homeTabRepository;
  GetAllCategoryUseCase({
    required this.homeTabRepository,
  });

  Future<Either<Failures, CategoryOrBrandsResponseEntity>> invoke() async {
    return await homeTabRepository.getAllCategories();
  }
}
