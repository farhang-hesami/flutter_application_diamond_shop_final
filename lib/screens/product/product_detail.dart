import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/bloc/product_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/comment.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/widgets/product_expandable_text.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/widgets/product_image_slider.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(DetailProductPageStarted(widget.product.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جزئیات محصول'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: AppColors.kAlert500,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is GetProductDetailSuccess) {
            var product = state.productDetailModel;
            return Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      16.0,
                      0.0,
                      16.0,
                      100.0,
                    ),
                    child: Column(
                      children: [
                        ProductImageSlider(product),
                        const SizedBox(height: 12.0),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            product.title!,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        const Divider(
                          thickness: 0.1,
                        ),
                        const SizedBox(height: 6.0),
                        ProductExpandableText(product),
                        const SizedBox(height: 6.0),
                        const Divider(
                          thickness: 0.1,
                        ),
                        const SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'نظرات کاربران',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: isLogin,
                              builder: (context, value, child) {
                                return value
                                    ? TextButton(
                                        onPressed: () {
                                          goScreen(
                                            context: context,
                                            screen: CommentScreen(product.id!),
                                          );
                                        },
                                        child: Text(
                                          'ثبت نظر',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: AppColors.kInfo500,
                                              ),
                                        ),
                                      )
                                    : const SizedBox();
                              },
                            )
                          ],
                        ),
                        product.comments!.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/comments.svg',
                                      width: 150.0,
                                      height: 150.0,
                                    ),
                                    const Text('نظری ثبت نشده است'),
                                  ],
                                ),
                              )
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var comment = product.comments![index];
                                  return SizedBox(
                                    height: 100.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                comment.subject!,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              comment.userEmail!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6.0),
                                        Text(
                                          comment.text!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 0.1,
                                  );
                                },
                                itemCount: product.comments!.length,
                              )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: 70.0,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kGray100,
                          blurRadius: 8.0,
                          offset: Offset(
                            0.0,
                            0.75,
                          ),
                        )
                      ],
                      color: AppColors.kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: isLogin,
                          builder: (context, value, child) {
                            return SizedBox(
                              height: 45.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.kPrimary500,
                                  foregroundColor: AppColors.kWhite,
                                ),
                                onPressed: value ? () {} : null,
                                child: const Text(
                                  'افزودن به سبد خرید',
                                ),
                              ),
                            );
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Before Discount :
                            product.hasDiscount!
                                ? Text(
                                    '${product.price!.toStringAsFixed(0).seRagham()} تومان',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          letterSpacing: 0.0,
                                        ),
                                  )
                                : Text(
                                    '',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                            //After Discount :
                            product.hasDiscount!
                                ? Text(
                                    '${product.discountPrice!.toStringAsFixed(0).seRagham()} تومان')
                                : Text(
                                    '${product.price!.toStringAsFixed(0).seRagham()} تومان',
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetProductDetailError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
