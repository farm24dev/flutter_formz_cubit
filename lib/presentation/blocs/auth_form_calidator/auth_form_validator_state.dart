part of 'auth_form_validator_cubit.dart';

class AuthFormValidatorState extends Equatable {
  const AuthFormValidatorState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.email = '',
    this.password = '',
    this.passwordObscureText = false,
  });

  final AutovalidateMode autovalidateMode;
  final String email;
  final String password;
  final bool passwordObscureText;

  @override
  List<Object> get props => [email, password, passwordObscureText];

  AuthFormValidatorState copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? password,
    bool? passwordObscureText,
  }) =>
      AuthFormValidatorState(
        autovalidateMode: autovalidateMode ?? this.autovalidateMode,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordObscureText: passwordObscureText ?? this.passwordObscureText,
      );
}
