// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> fr = {
    "hello": "Hello",
    "errorLaunchUrl":
        "Il n'est pas possible d'ouvrir ce lien actuellement. Veuillez essayer plus tard.",
    "dateTimeAt": "{date} à {time}",
    "tomorrowAt": "Demain à {format}",
    "yesterdayAt": "Hier à {date}",
    "email": "E-mail",
    "password": "Mot de passe",
    "newPassword": "Nouveau @:password",
    "passwordConfirmation": "Mot de passe de confirmation",
    "passwordForgotten": "@:password oublié ?",
    "validatorEmailEmpty": "Veuillez saisir votre @:email.",
    "validatorEmailInvalid": "Veuillez entrer une @:email valide",
    "validatorPasswordEmpty": "Veuillez entrer votre @:password",
    "validatorRequiredField": "Ce champ est obligatoire",
    "validatorPasswordInvalid":
        "Le @:password doit comporter au moins {count} caractères.",
    "validatorPasswordConfirmationInvalid":
        "Le @:passwordConfirmation doit être le même que le @:password",
    "validatorEqualLengthValue": {
      "zero": "La valeur ne doit pas comporter de caractère.",
      "one": "La valeur doit comporter un caractère.",
      "other": "La valeur doit comporter {count} caractères."
    },
    "dark": "Dark",
    "light": "Light",
    "system": "System",
    "ok": "Ok",
    "no": "Non",
    "cancel": "Annuler",
    "yes": "Oui",
    "error": "Erreur",
    "oups": "Oups",
    "success": "Succès",
    "warning": "Attention",
    "info": "Info",
    "skip": "Passer",
    "login": "Connexion",
    "logout": "Déconnexion",
    "reset": "Réinitialiser",
    "validate": "Valider",
    "update": "Modifier",
    "confirm": "Confirmer",
    "submit": "Envoyer",
    "unknownError":
        "Une erreur inconnue s'est produite. Veuillez essayer plus tard.",
    "authenticationFailed":
        "L'e-mail ou le mot de passe que vous avez fourni n'est pas reconnu.",
    "incorrectPassword": "Mot de passe incorrect, veuillez réessayer.",
    "redirection": "Redirection",
    "redirectConfirmation": "Vous allez être redirigé vers un lien externe."
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"fr": fr};
}
