//todo viewModel => Usecase
// usecas => repo
// repo => datasource
// data source => api

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/repository/dataSource/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/cart_remote_dataSource_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/home_tab_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/dataSource/products_remote_data_source.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/cart_repository_impl.dart';
import 'package:e_commerce_app/data/repository/repository/home_tab_repo_impl.dart';
import 'package:e_commerce_app/data/repository/repository/products_tab_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/products_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import 'package:e_commerce_app/domain/repository/repository/products_tab_repository.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/delete_cart_item_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_catogories_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_cart_items_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/login_useCase.dart';
import 'package:e_commerce_app/domain/use_cases/signup_usecase.dart';
import 'package:e_commerce_app/domain/use_cases/update_cart_item_use_case.dart';

SignUpUseCase injectSignUpUseCase() {
  return SignUpUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

DeleteCartItemsUseCase injectDeleteCartItemsUseCase() {
  return DeleteCartItemsUseCase(cartRepository: injectCartRepository());
}

UpdateCartItemsUseCase injectUpdateCartItemsUseCase() {
  return UpdateCartItemsUseCase(cartRepository: injectCartRepository());
}

GetCartItemsUseCase injectGetCartItemsUseCase() {
  return GetCartItemsUseCase(cartRepository: injectCartRepository());
}

CartRepository injectCartRepository() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllProductsUseCase injectGetAllProductUseCase() {
  return GetAllProductsUseCase(
      productTabRepository: injectProductTabRepostory());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(productTabRepository: injectProductTabRepostory());
}

ProductTabRepository injectProductTabRepostory() {
  return ProductsTabRepositoryImpl(
      productsTabRemoteDataSource: injectProductsTabRemoteDataSource());
}

ProductsTabRemoteDataSource injectProductsTabRemoteDataSource() {
  return ProductsTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
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
