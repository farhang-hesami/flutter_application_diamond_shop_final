import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/product.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';

class ProductExpandableText extends StatefulWidget {
  const ProductExpandableText(this.productDetailModel, {super.key});
  final ProductDetailModel productDetailModel;
  @override
  State<ProductExpandableText> createState() => _ProductExpandableTextState();
}

class _ProductExpandableTextState extends State<ProductExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'توضیحات محصول',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 6.0),
            Text(
              widget.productDetailModel.description!,
              maxLines: isExpanded ? null : 2,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.kGray600,
                  ),
              textAlign: TextAlign.justify,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpanded ? 'بستن' : 'مشاهده بیشتر',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.kInfo500,
                      ),
                    ),
                    isExpanded
                        ? Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: AppColors.kInfo500,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.kInfo500,
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
