part of 'home_tab_view_model_cubit.dart';

sealed class HomeTabViewState {}

final class HomeTabViewModelInitial extends HomeTabViewState {}

final class CategoriesLoadingState extends HomeTabViewState {
  String loadingMsg = "Loading...";
}

final class CategoriesErrorState extends HomeTabViewState {
  Failures? error;
  CategoriesErrorState({
    required this.error,
  });
}

final class CategoriesSuccesState extends HomeTabViewState {
  late CategoryOrBrandsResponseEntity categoryResponseEntity;
  CategoriesSuccesState({required this.categoryResponseEntity});
}

final class BrandsLoadingState extends HomeTabViewState {
  String loadingMsg = "Loading...";
}

final class BrandsErrorState extends HomeTabViewState {
  Failures? error;
  BrandsErrorState({
    required this.error,
  });
}

final class BrandsSuccesState extends HomeTabViewState {
  late CategoryOrBrandsResponseEntity brandResponseEntity;
  BrandsSuccesState({required this.brandResponseEntity});
}
