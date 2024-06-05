import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/product.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider(this.productDetailModel, {super.key});
  final ProductDetailModel productDetailModel;
  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int CurrentSliderIndex = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                CurrentSliderIndex = index;
              });
            },
            height: 160.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
          items: widget.productDetailModel.images!.map(
            (i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Icon(Icons.error),
                    );
                  },
                  placeholder: (context, url) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                  imageUrl: 'https://flutter.vesam24.com/${i}',
                  fit: BoxFit.fill,
                ),
              );
            },
          ).toList(),
        ),
        Positioned(
          bottom: 10.0,
          child: AnimatedSmoothIndicator(
            activeIndex: CurrentSliderIndex,
            count: widget.productDetailModel.images!.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.kPrimary500,
              dotColor: AppColors.kGray100,
              dotHeight: 6.0,
              dotWidth: 6.0,
            ),
          ),
        ),
        Positioned(
          right: 6,
          child: CircleAvatar(
            backgroundColor: AppColors.kGray100,
            foregroundColor: AppColors.kGray500,
            child: IconButton(
              onPressed: () {
                carouselController.nextPage();
              },
              icon: const Icon(Icons.chevron_left),
            ),
          ),
        ),
        Positioned(
          left: 6,
          child: CircleAvatar(
            backgroundColor: AppColors.kGray100,
            foregroundColor: AppColors.kGray500,
            child: IconButton(
              onPressed: () {
                carouselController.previousPage();
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ],
    );
  }
}
