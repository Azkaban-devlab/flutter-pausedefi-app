import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/auth.endpoint.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:app/presentation/viewmodels/auth/auth.viewmodel.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// [AuthScreen]
///
class AuthScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const AuthScreen({
    Key? key,
    this.onAuthenticated,
  }) : super(key: key);

  /// callback called when authentication succeed
  final VoidCallback? onAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            AuthViewModel?.buildWithProvider(builder: (_, __) => _AuthBody()));
  }
}

class _AuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthViewModel model = AuthViewModel.provide(context);
    return Column(children: [
      const SizedBox(
        height: 40,
      ),
      const Image(
        image: AssetImage('assets/images/logo-color.png'),
        fit: BoxFit.fitHeight,
        height: 80,
      ),
      const SizedBox(
        height: 25,
      ),
      AnimatedToggle(
          values: ['Se connecter', "S'inscrire"],
          onToggleCallback: (dynamic newValue) => null),
      const SizedBox(
        height: 35,
      ),
      Expanded(
          child: Container(
              color: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: TextVariant(
                      model.isLogin
                          ? 'Connexion'.toUpperCase()
                          : 'Inscription'.toUpperCase(),
                      variantType: TextVariantType.headline6,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
                    const SizedBox(
                      height: 40,
                    ),
                    Visibility(
                        visible: !model.isLogin,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 5),
                                      child: const TextVariant(
                                        'Prénom',
                                        variantType: TextVariantType.caption,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                      height: 40,
                                      child: FormInput(
                                        hintText: 'Prénom',
                                        //controller: model.firstNameController,
                                        borderType: FormInputBorderType.outline,
                                        inputBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        validator: (String? v) =>
                                            ValidatorHelper.validateRequired(v)
                                                .message,
                                      )),
                                ],
                              )),
                              const SizedBox(
                                width: 60,
                              ),
                              Flexible(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 5),
                                      child: const TextVariant(
                                        'Nom',
                                        variantType: TextVariantType.caption,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                      height: 40,
                                      child: FormInput(
                                        hintText: 'Nom',
                                        //controller: model.lastNameController,
                                        borderType: FormInputBorderType.outline,
                                        inputBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        validator: (String? v) =>
                                            ValidatorHelper.validateRequired(v)
                                                .message,
                                      )),
                                ],
                              ))
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 5),
                        child: const TextVariant(
                          'Email',
                          variantType: TextVariantType.caption,
                          color: Colors.white,
                        )),
                    SizedBox(
                        height: 40,
                        child: FormInput(
                          hintText: 'Email',
                          controller: model.emailController,
                          borderType: FormInputBorderType.outline,
                          inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (String? v) =>
                              ValidatorHelper.validateEmail(v).message,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 5),
                        child: const TextVariant(
                          'Mot de passe',
                          variantType: TextVariantType.caption,
                          color: Colors.white,
                        )),
                    SizedBox(
                        height: 40,
                        child: FormInput(
                          hintText: 'Mot de passe',
                          obscureText: !model.isPasswordVisible,
                          controller: model.passwordController,
                          borderType: FormInputBorderType.outline,
                          inputBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              model.updatePasswordEye();
                            },
                            color: CustomColors.greyColor,
                            icon: Icon(model.isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                          validator: (String? v) =>
                              ValidatorHelper.validatePassword(v, minLength: 0)
                                  .message,
                        )),
                    Visibility(
                        visible: !model.isLogin,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 5),
                                  child: const TextVariant(
                                    'Confirmer le mot de passe',
                                    variantType: TextVariantType.caption,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                  height: 40,
                                  child: FormInput(
                                    hintText: 'Confirmer le mot de passe',
                                    obscureText: !model.isPasswordVisible,
                                    //controller: model.confirmPasswordController,
                                    borderType: FormInputBorderType.outline,
                                    inputBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        model.updatePasswordEye();
                                      },
                                      color: CustomColors.greyColor,
                                      icon: Icon(model.isPasswordVisible
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                    ),
                                    validator: (String? v) =>
                                        ValidatorHelper.validatePassword(v,
                                                minLength: 0)
                                            .message,
                                  )),
                            ])),
                    const SizedBox(
                      height: 45,
                    ),
                    Visibility(
                        visible: model.isLogin,
                        child: Column(
                          children: [
                            Center(
                                child: TextButton(
                              onPressed: () => null,
                              child: const Text(
                                'Mot de passe oublié ?',
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                                textAlign: TextAlign.center,
                              ),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    PrimaryTextButton(
                        label: 'Valider',
                        onTap: () => model.handleLogin(context)),
                  ],
                ),
              ))),
    ]);
  }
}

class AnimatedToggle extends StatelessWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;

  const AnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthViewModel model = AuthViewModel.provide(context);
    return Container(
      width: 310,
      height: 38,
      margin: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              model.isLogin = !model.isLogin;
              model.notifyListeners();
            },
            child: Container(
              width: 310,
              height: 38,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  values.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      values[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                model.isLogin ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 155,
              height: 38,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                model.isLogin ? values[0] : values[1],
                style: const TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
