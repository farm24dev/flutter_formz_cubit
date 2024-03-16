import 'package:flutter/material.dart';
import 'package:flutter_formz_cubit/constants/app_color.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.onTapSuffix,
  });
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText;
  final VoidCallback? onTapSuffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle().copyWith(color: AppColors.primary),
      onChanged: onChanged,
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
        suffix: onTapSuffix == null
            ? null
            : InkWell(
                onTap: onTapSuffix,
                child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              ),
      ),
      cursorColor: AppColors.primary,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
