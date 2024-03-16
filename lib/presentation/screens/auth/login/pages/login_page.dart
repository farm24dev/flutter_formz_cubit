import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_formz_cubit/constants/app_color.dart';
import 'package:flutter_formz_cubit/presentation/blocs/auth_form_calidator/auth_form_validator_cubit.dart';
import 'package:flutter_formz_cubit/presentation/widgets/text_form_field_custom.dart';
import 'package:flutter_formz_cubit/utils/validator_helper.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthFormValidatorCubit _authFormValidatorCubit = AuthFormValidatorCubit();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  child: BlocSelector<AuthFormValidatorCubit, AuthFormValidatorState, AutovalidateMode>(
                    bloc: _authFormValidatorCubit,
                    selector: (state) => state.autovalidateMode,
                    builder: (context, autovalidateMode) {
                      return Form(
                        key: _formKey,
                        autovalidateMode: autovalidateMode,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormFieldCustom(
                              labelText: 'Email',
                              hintText: 'Email',
                              onChanged: _authFormValidatorCubit.updateEmail,
                              validator: ValidatorHelper.validateEmail,
                            ),
                            const SizedBox(height: 12),
                            BlocSelector<AuthFormValidatorCubit, AuthFormValidatorState, bool>(
                              bloc: _authFormValidatorCubit,
                              selector: (state) {
                                return state.passwordObscureText;
                              },
                              builder: (context, passwordObscureText) {
                                return TextFormFieldCustom(
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  onChanged: _authFormValidatorCubit.updatePassword,
                                  validator: ValidatorHelper.validatePassword,
                                  obscureText: passwordObscureText,
                                  onTapSuffix: _authFormValidatorCubit.togglePasswordObscureText,
                                );
                              },
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Do your job here
                                } else {
                                  _authFormValidatorCubit.updateAutovalidateMode(AutovalidateMode.always);
                                }
                              },
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
