import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_form_validator_state.dart';

class AuthFormValidatorCubit extends Cubit<AuthFormValidatorState> {
  AuthFormValidatorCubit() : super(const AuthFormValidatorState());

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void togglePasswordObscureText() {
    log('togglePasswordObscureText ${state.passwordObscureText}');
    emit(state.copyWith(passwordObscureText: !state.passwordObscureText));
  }
}
