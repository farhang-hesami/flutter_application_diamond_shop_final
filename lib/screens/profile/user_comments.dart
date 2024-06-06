import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/product_detail.dart';
import 'package:flutter_application_diamond_shop_final/screens/profile/bloc/profile_bloc.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/date_formatter.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCommentsScreen extends StatefulWidget {
  const UserCommentsScreen({super.key});

  @override
  State<UserCommentsScreen> createState() => _UserCommentsScreenState();
}

class _UserCommentsScreenState extends State<UserCommentsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(UserCommentsScreenStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظرات من'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is UserCommentsSuccess) {
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 50.0),
              itemCount: state.userComments.length,
              itemBuilder: (context, index) {
                var comment = state.userComments[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    goScreen(
                      context: context,
                      screen: ProductDetailScreen(
                        Product(
                          id: comment.productId,
                        ),
                      ),
                      fullScreen: true,
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://flutter.vesam24.com/${comment.productImage}',
                        width: 70.0,
                        height: 70.0,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment.productTitle!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '${convertDateAndTime(comment.createDate!).$2} - ${convertDateAndTime(comment.createDate!).$1}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: AppColors.kGray50,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment.productTitle!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Text(comment.text!)
                                ],
                              ),
                            ),
                            const SizedBox(height: 6.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          } else if (state is UserCommentsError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: const CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
