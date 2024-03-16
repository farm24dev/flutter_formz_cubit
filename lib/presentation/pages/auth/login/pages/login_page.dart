import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_formz_cubit/constants/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 150,
                style: FlutterLogoStyle.horizontal,
                textColor: AppColors.tertiary,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldCustom(
                      labelText: 'Email',
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 12),
                    TextFormFieldCustom(
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(
                          Size(size.width * .5, 40),
                        ),
                        overlayColor: MaterialStatePropertyAll(AppColors.secondary),
                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: const TextStyle().copyWith(
                          color: AppColors.tertiary,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key,
    this.labelText,
    this.hintText,
  });
  final String? labelText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle().copyWith(color: AppColors.primary),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText ?? '',
        labelText: hintText ?? '',
        labelStyle: const TextStyle().copyWith(color: AppColors.primary),
        hintStyle: const TextStyle().copyWith(color: AppColors.secondary),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
      cursorColor: AppColors.primary,
    );
  }
}
