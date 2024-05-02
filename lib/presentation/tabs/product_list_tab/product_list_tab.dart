import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/presentation/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';

import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/custom_text_field.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/cubit/product_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/widgets/grid_view_card_item.dart';

import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductTabViewModel productTabViewModel = ProductTabViewModel(
    getAllProductsUseCase: injectGetAllProductUseCase(),
    addToCartUseCase: injectAddToCartUseCase(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabViewModel>(
      create: (context) => productTabViewModel..getAllProducts(),
      child: BlocBuilder<ProductTabViewModel, ProductTabViewModelState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      MyAssets.logo,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomTextField(),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, CartScreen.routeName);
                        },
                        child: Badge(
                          label: Text(
                              productTabViewModel.numberOfCartItems.toString()),
                          child: ImageIcon(
                            AssetImage(MyAssets.shoppingCart),
                            size: 28.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is ProductLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                              itemCount: productTabViewModel.products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2 / 2.4,
                                      crossAxisSpacing: 16.w,
                                      mainAxisSpacing: 16.h),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      ProductDetailsView.routeName,
                                      arguments:
                                          productTabViewModel.products[index],
                                    );
                                  },
                                  child: GridViewCardItem(
                                    product:
                                        productTabViewModel.products[index],
                                  ),
                                );
                              },
                            ),
                          )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
