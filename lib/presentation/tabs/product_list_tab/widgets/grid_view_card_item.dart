import 'package:e_commerce_app/domain/entities/products_response_entity/product_response_entity.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/cubit/product_tab_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';

class GridViewCardItem extends StatelessWidget {
  bool isWishlisted = false;
  ProductEntity product;
  GridViewCardItem({
    super.key,
    required this.product,
  });

  //todo: product
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  product.imageCover ?? "",
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: isWishlisted == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(
                            Icons.favorite_border_rounded,
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${product.price} ",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  "Review (${product.ratingsAverage})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Image.asset(
                  MyAssets.starIcon,
                ),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    //todo: add to cart
                    ProductTabViewModel.get(context)
                        .addToCart(productID: product.id ?? "");
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
          // GridViewCardItemBody(
          //   productEntity: productEntity,
          // )
        ],
      ),
    );
  }
}
