import 'package:flutter/material.dart';
import 'package:flutter_formz_cubit/constants/app_color.dart';
import 'package:flutter_formz_cubit/presentation/screens/auth/login/pages/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1),
          () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false));
    });
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.dark,
              AppColors.primary,
              AppColors.secondary,
              AppColors.tertiary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FlutterLogo(
            size: 150,
            style: FlutterLogoStyle.horizontal,
            textColor: AppColors.tertiary,
          ),
        ),
      ),
    );
  }
}
