import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/root.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/bloc/home_bloc.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_application_diamond_shop_final/utils/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnectedToInternet = true;
  void checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        isConnectedToInternet = true;
        BlocProvider.of<HomeBloc>(context).add(HomeScreenStarted());
      } else {
        isConnectedToInternet = false;
      }
    });
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary500,
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccess) {
            goScreen(
              context: context,
              screen: const RootScreen(),
              closeScreen: true,
            );
          }
          if (state is HomeError) {
            showCustomAlert(context, state.error, AlertType.error);
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 100.0,
                height: 100.0,
                colorFilter: ColorFilter.mode(
                  AppColors.kWhite,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 24.0),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kWhite,
                      ),
                  text: 'به فروشگاه',
                  children: const [
                    TextSpan(
                      text: ' الماس',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: ' خوش آمدید',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              isConnectedToInternet
                  ? const CupertinoActivityIndicator(
                      color: AppColors.kWhite,
                    )
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.kWhite,
                        ),
                      ),
                      onPressed: () {
                        checkInternet();
                      },
                      child: const Text(
                        'تلاش مجدد',
                        style: TextStyle(
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}
