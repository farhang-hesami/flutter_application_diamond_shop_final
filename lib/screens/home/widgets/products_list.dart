import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/widgets/product_item.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    required this.products,
    required this.title,
    required this.seeAllProductsOnTap,
    super.key,
  });
  final List<Product> products;
  final String title;
  final Function() seeAllProductsOnTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              TextButton(
                onPressed: seeAllProductsOnTap,
                child: Row(
                  children: [
                    Text(
                      'مشاهده همه',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.kInfo500,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.kInfo500,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: ProductItem(product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
