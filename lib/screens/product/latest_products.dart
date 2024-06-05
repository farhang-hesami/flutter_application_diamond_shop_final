import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/widgets/product_item.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LatestProductsScreen extends StatefulWidget {
  const LatestProductsScreen({super.key});

  @override
  State<LatestProductsScreen> createState() => _LatestProductsScreenState();
}

class _LatestProductsScreenState extends State<LatestProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(LatestProductsPageStarted());
    super.initState();
  }

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
            Text('Diamond Shop'),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is GetLatestProductSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'جدیدترین محصولات',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      itemCount: state.productModel.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: (context, index) {
                        var product = state.productModel.products![index];
                        return Center(
                          child: ProductItem(product: product),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetLatestProductError) {
            return Center(
              child: Text(
                state.error,
              ),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
