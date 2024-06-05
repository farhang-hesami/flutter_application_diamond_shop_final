import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/product_detail.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 170.0,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              goScreen(
                context: context,
                screen: ProductDetailScreen(product),
                fullScreen: true,
              );
            },
            child: Column(
              children: [
                SizedBox(
                  width: 170.0,
                  height: 160.0,
                  child: CachedNetworkImage(
                    imageUrl: 'https://flutter.vesam24.com/${product.image}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: 170.0,
                  child: Text(
                    product.title!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Before Discount :
                          product.hasDiscount!
                              ? Text(
                                  '${product.price!.toStringAsFixed(0).seRagham()} تومان',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        letterSpacing: 0.0,
                                      ),
                                )
                              : Text(
                                  '',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                          //After Discount :
                          product.hasDiscount!
                              ? Text(
                                  '${product.discountPrice!.toStringAsFixed(0).seRagham()} تومان')
                              : Text(
                                  '${product.price!.toStringAsFixed(0).seRagham()} تومان',
                                ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: isLogin,
                      builder: (context, value, child) {
                        return value
                            ? CircleAvatar(
                                backgroundColor: AppColors.kPrimary500,
                                foregroundColor: AppColors.kWhite,
                                radius: 18.0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    size: 18.0,
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kGray100,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: const Icon(
                Icons.favorite_outlined,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
