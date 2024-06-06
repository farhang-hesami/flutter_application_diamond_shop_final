import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/screens/profile/bloc/profile_bloc.dart';
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
              itemCount: state.userComments.length,
              itemBuilder: (context, index) {
                var comment = state.userComments[index];
                return Row(
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.productTitle!,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ],
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
