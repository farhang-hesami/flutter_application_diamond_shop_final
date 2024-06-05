import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/data/services/authentication.dart';
import 'package:flutter_application_diamond_shop_final/data/services/home.dart';
import 'package:flutter_application_diamond_shop_final/data/services/product.dart';
import 'package:flutter_application_diamond_shop_final/data/services/profile.dart';
import 'package:flutter_application_diamond_shop_final/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/bloc/home_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/product/bloc/product_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/profile/bloc/profile_bloc.dart';
import 'package:flutter_application_diamond_shop_final/screens/splash.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navigatorKey = GlobalKey<NavigatorState>();
late final SharedPreferences prefs;
ValueNotifier<bool> isLogin = ValueNotifier(false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  isLogin.value = prefs.getString('token') != null;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(HomeService()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductService()),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(
            AuthenticationServise(),
            HomeService(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(ProfileService()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Diamond Shop',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // persian
      ],
      locale: Locale('fa', 'IR'),
      theme: LightTheme(),
      home: SplashScreen(),
    );
  }
}
