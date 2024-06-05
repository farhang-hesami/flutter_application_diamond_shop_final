import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/screens/authentication/authentication.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_svg/svg.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/guest.svg',
            width: 300.0,
            height: 300.0,
          ),
          Text(
            'لطفا به حساب کاربری خود وارد شوید',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () {
              goScreen(
                context: context,
                screen: const AuthenticationScreen(),
              );
            },
            child: Text(
              'ورود به حساب کاربری',
            ),
          ),
        ],
      ),
    );
  }
}
