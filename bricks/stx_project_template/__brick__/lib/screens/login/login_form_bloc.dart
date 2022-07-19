import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:{{project_name}}/blocs/index.dart';
import 'package:{{project_name}}/screens/auth/auth_repository.dart';

@injectable
class LoginFormBloc extends FormBloc<String, String> {
  late TextFieldBloc username;
  late TextFieldBloc password;

  final AuthBloc authBloc;
  final AuthRepository repository;

  LoginFormBloc({
    required this.authBloc,
    required this.repository,
  }) : super() {
    username = TextFieldBloc(
      required: true,
      rules: [ValidationType.onBlur],
    );

    password = TextFieldBloc(
      required: true,
      customValidators: [FieldBlocValidators.passwordMin6Chars],
      rules: [ValidationType.onBlur],
    );

    addFields([
      username,
      password,
    ]);
  }

  @override
  FutureOr<void> onSubmit() async {
    try {
      final authData = await repository.login(username.value, password.value);

      emitSuccess(authData);
    } catch (e) {
      emitFailure('Something went wrong!');
    }
  }
}