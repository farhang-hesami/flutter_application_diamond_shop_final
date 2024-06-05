import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/guest.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/bloc/home_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/profile/user_comments.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اطلاعات کاربری'),
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (value) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.kGray50,
                    radius: 40.0,
                    foregroundColor: AppColors.kGray700,
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    currentUser!.fullName!,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    currentUser!.phoneNumber!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.message_outlined,
                    ),
                    title: Text('نظرات من'),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                    ),
                    onTap: () {
                      goScreen(
                          context: context, screen: const UserCommentsScreen());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.favorite_border_outlined,
                    ),
                    title: Text('لیست مورد علاقه ها'),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.payment_outlined,
                    ),
                    title: Text('پرداخت های من'),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                    ),
                    onTap: () {},
                  ),
                  const Divider(),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () async {
                      await prefs.remove('token');
                      isLogin.value = false;
                      currentUser = null;
                    },
                    icon: const Icon(
                      Icons.exit_to_app_outlined,
                      color: AppColors.kAlert500,
                    ),
                    label: Text(
                      'خروج از حساب کاربری',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.kAlert500,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}
