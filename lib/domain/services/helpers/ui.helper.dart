import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show AppBar, Colors, Material;
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// Here you must have all helpers function
/// depending of the context (BuildContext)
///
class UiHelper {
  ///
  /// Get default [AppBar]
  ///
  static AppBar appBar(BuildContext context,
      {String? title, List<Widget>? actions}) {
    return AppBar(
      actions: actions ?? <Widget>[],
      backgroundColor: Colors.transparent,
      title: title == null
          ? null
          : Text(
              title,
              style: TextStyles.appBarTitleStyle(context: context),
            ),
      flexibleSpace: const Material(
        elevation: 8,
        child: Image(
          image: AssetImage('assets/images/bg_header.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ///
  /// Get distance as human readdable
  ///
  static String humanDistance(int distance) {
    if (distance < 1000) {
      return '${distance}m';
    } else if (distance == 1000) {
      return '1Km';
    } else {
      return '${(distance / 1000).toStringAsFixed(2)}Km';
    }
  }

  ///
  /// Launch external URL
  ///
  static Future<bool> launchUrl(BuildContext context, String url,
      {String? errorMessage}) async {
    final bool? hasAccepted = await DialogService.showPrompt(context,
        tr(LocaleKeys.redirection), tr(LocaleKeys.redirectConfirmation));
    if (hasAccepted ?? false) {
      if (await canLaunch(url)) {
        return launch(url);
      } else {
        await DialogService.showWarning<dynamic>(
            context, errorMessage ?? tr(LocaleKeys.errorLaunchUrl));
        return false;
      }
    }
    return false;
  }
}
