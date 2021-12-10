import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/data/resources/http/dto/requests/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/dto/responses/auth/recover.dto.dart';
import 'package:app/domain/data/resources/http/endpoints/auth.endpoint.dart';
import 'package:app/domain/data/resources/http/models/error.response.dart';
import 'package:app/domain/services/helpers/validator.helper.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
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
    final TextEditingController _nameController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormInput(
                    hintText: 'Votre nom...',
                    controller: _nameController,
                    validator: (String? v) =>
                        ValidatorHelper.validateRequired(v).message,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryTextButton(
                    label: tr(LocaleKeys.login),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _handleLogin(context, _nameController.text);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context, String text) {
    AuthenticationService.injected()
        .authenticate(context, AuthenticationData(email: text, password: text));
    AuthEndpoint()
        .recover(RecoverRequestDTO(email: text))
        .then((RecoverResponseDTO value) {})
        .catchError((Object error) {
      if (error is ErrorResponse) {}
    });
  }
}
