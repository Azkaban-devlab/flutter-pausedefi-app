import 'package:app/domain/data/resources/http/dto/requests/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/auth.endpoint.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/infrastructure/abstracts/lockable_view_model.abstract.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// [AuthViewModel]
///
class AuthViewModel extends LockableViewModel {
  ///
  /// Constructor
  ///
  AuthViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isPasswordVisible = false;
  bool isLogin = true;

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<AuthViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (BuildContext context) => AuthViewModel(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static AuthViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<AuthViewModel>(context, listen: listen);
  }

  void updatePasswordEye() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void updateFormType() {
    isLogin = !isLogin;
    notifyListeners();
  }

  void handleLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (isLogin) {
        AuthenticationService.injected().authenticate(
            context,
            AuthenticationData(
                email: emailController.text,
                password: passwordController.text));
      } else {
        AuthenticationService.injected().register(
            context,
            RegisterData(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                password: passwordController.text));
      }
    }
    /*_authEndpoint
        .recover(RecoverRequestDTO(email: emailController.text))
        .then((RecoverResponseDTO value) {})
        .catchError((Object error) {
      if (error is ErrorResponse) {}
    });*/
  }
}
