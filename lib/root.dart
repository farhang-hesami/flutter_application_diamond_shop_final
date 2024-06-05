import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/screens/basket/basket_screen.dart';

import 'package:flutter_application_diamond_shop_final/screens/home/home_screen.dart';
import 'package:flutter_application_diamond_shop_final/screens/profile/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;
  final GlobalKey<NavigatorState> homeKey = GlobalKey();
  final GlobalKey<NavigatorState> basketKey = GlobalKey();
  final GlobalKey<NavigatorState> profileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'صفحه اصلی',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_outlined),
            label: 'سبد خرید',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'اطلاعات کاربری',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Navigator(
            key: homeKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => HomeScreen(),
                settings: settings,
              );
            },
          ),
          Navigator(
            key: basketKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => BasketScreen(),
                settings: settings,
              );
            },
          ),
          Navigator(
            key: profileKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => ProfileScreen(),
                settings: settings,
              );
            },
          ),
        ],
      ),
    );
  }
}
