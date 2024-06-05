import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/guest.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سبد خرید'),
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (value) {
            return const Center(
              child: const Text('User'),
            );
          } else {
            return const GuestScreen();
          }
        },
      ),
    );
  }
}
