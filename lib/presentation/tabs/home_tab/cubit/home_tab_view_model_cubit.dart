import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/entities/brands_response_entity/brand_response_entitiy.dart';

import 'package:e_commerce_app/domain/entities/category_response_entity/category_response_entity.dart';
import 'package:e_commerce_app/domain/entities/failures/failures.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_catogories_use_case.dart';

part 'home_tab_view_model_state.dart';

class HomeTabViewModel extends Cubit<HomeTabViewState> {
  HomeTabViewModel(
      {required this.getAllCategoryUseCase, required this.getAllBrandsUseCase})
      : super(HomeTabViewModelInitial());
  List<CategoryOrBrandsEntity> categoriesList = [];
  List<CategoryOrBrandsEntity> brandsList = [];
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  void getAllCategories() async {
    emit(CategoriesLoadingState());
    var either = await getAllCategoryUseCase.invoke();

    either.fold((l) {
      emit(CategoriesErrorState(error: l));
    }, (response) {
      categoriesList = response.data ?? [];
      emit(CategoriesSuccesState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();

    either.fold((l) {
      emit(BrandsErrorState(error: l));
    }, (response) {
      brandsList = response.data ?? [];
      emit(BrandsSuccesState(brandResponseEntity: response));
    });
  }
}
