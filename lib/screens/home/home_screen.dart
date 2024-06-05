import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/bloc/home_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/widgets/home_slider_widget.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/widgets/products_list.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/latest_products.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/popular_product.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            SizedBox(width: 8.0),
            Text('فروشگاه الماس'),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 50.0),
              child: Column(
                children: [
                  HomeSlider(state.homeModel),
                  ProductsList(
                    products: state.homeModel.news!,
                    title: 'جدیدترین محصولات',
                    seeAllProductsOnTap: () {
                      goScreen(
                        context: context,
                        screen: const LatestProductsScreen(),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 0.1,
                  ),
                  ProductsList(
                    products: state.homeModel.mostVisited!,
                    title: 'پربازدیدترین محصولات',
                    seeAllProductsOnTap: () {
                      goScreen(
                        context: context,
                        screen: const PopularProductsScreen(),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
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
