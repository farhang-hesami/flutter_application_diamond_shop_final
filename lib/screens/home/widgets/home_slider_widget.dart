import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  final HomeModel homeModel;
  const HomeSlider(this.homeModel, {super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int CurrentSliderIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
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
          items: widget.homeModel.slides!.map(
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
                  imageUrl: 'https://flutter.vesam24.com/${i.image}',
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
            count: widget.homeModel.slides!.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.kPrimary500,
              dotColor: AppColors.kGray100,
              dotHeight: 6.0,
              dotWidth: 6.0,
            ),
          ),
        ),
      ],
    );
  }
}
