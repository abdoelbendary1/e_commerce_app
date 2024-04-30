//todo viewModel => Usecase
// usecas => repo
// repo => datasource
// data source => api

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/dataSource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/home_tab_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/home_tab_repo_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_catogories_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/login_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/signup_usecase.dart';

SignUpUseCase injectSignUpUseCase() {
  return SignUpUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

GetAllBrandsUseCase injectGetBrandsUseCase() {
  return GetAllBrandsUseCase(homeTabRepository: injectHomeTabRepository());
}

GetAllCategoryUseCase injectGetCategoriesUseCase() {
  return GetAllCategoryUseCase(homeTabRepository: injectHomeTabRepository());
}

HomeTabRepository injectHomeTabRepository() {
  return HomeTabRepositoryImpl(
      homeTabRemoteDataSource: injectHomeTabDataSource());
}

HomeTabDataSourceImpl injectHomeTabDataSource() {
  return HomeTabDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthDataSource());
}

AuthRemoteDataSource injectAuthDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
