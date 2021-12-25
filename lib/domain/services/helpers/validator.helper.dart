import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

///
/// [ValidatorHelper]
///
class ValidatorHelper {
  static final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  ///
  /// Validate email
  ///
  static ValidatorState validateEmail(String? field) {
    bool isValid = true;
    String? message;

    if (field == null) {
      isValid = false;
      message = tr(LocaleKeys.validatorRequiredField);
    }

    if (field!.isEmpty) {
      isValid = false;
      message = tr(LocaleKeys.validatorEmailEmpty);
    } else if (!_emailRegex.hasMatch(field)) {
      isValid = false;
      message = tr(LocaleKeys.validatorEmailInvalid);
    }

    return ValidatorState(isValid: isValid, message: message);
  }

  ///
  /// Validate password
  ///
  static ValidatorState validatePassword(String? password,
      {int minLength = 8}) {
    bool isValid = true;
    String? message;

    if (password == null) {
      isValid = false;
      message = tr(LocaleKeys.validatorRequiredField);
    }

    if (password!.length < minLength) {
      isValid = false;
      message = tr(LocaleKeys.validatorPasswordInvalid,
          namedArgs: <String, String>{'count': minLength.toString()});
    }

    if (password.isEmpty) {
      isValid = false;
      message = tr(LocaleKeys.validatorPasswordEmpty);
    }

    return ValidatorState(isValid: isValid, message: message);
  }

  ///
  /// Validate password
  ///
  static ValidatorState validateConfirmPassword(
      String? confirmPassword, String? password,
      {int minLength = 8}) {
    bool isValid = true;
    String? message;

    if (confirmPassword == null) {
      isValid = false;
      message = tr(LocaleKeys.validatorRequiredField);
    }

    if (confirmPassword!.isEmpty) {
      isValid = false;
      message = tr(LocaleKeys.validatorPasswordEmpty);
    }

    if (confirmPassword != password) {
      isValid = false;
      message =
          'Votre mot de passe de confirmation et votre mot de passe ne correspondent pas.';
    }

    return ValidatorState(isValid: isValid, message: message);
  }

  ///
  /// Validate field required
  ///
  static ValidatorState validateRequired(dynamic value) {
    bool isValid = true;
    String? message;

    if (value == null || (value is String && value.isEmpty)) {
      isValid = false;
      message = tr(LocaleKeys.validatorRequiredField);
    }

    return ValidatorState(isValid: isValid, message: message);
  }
}

///
/// [ValidatorState]
///
class ValidatorState {
  ///
  /// isValid
  ///
  final bool isValid;

  ///
  /// Error message
  ///
  final String? message;

  ///
  /// Constructor
  ///
  ValidatorState({required this.isValid, this.message});

  ///
  /// isNotValid
  ///
  bool get isNotValid => !isValid;
}
