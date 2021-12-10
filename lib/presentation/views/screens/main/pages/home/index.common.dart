import 'package:app/application/localizations/locale_keys.g.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/presentation/views/widgets/custom/component_scaffold.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

///
/// [HomeCommonScreen]
///
class HomeCommonScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const HomeCommonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentScaffold(
      primary: true,
      appBar: AppBar(
        title: TextVariant(
          'WELCOME ${AuthenticationService.injected().user?.firstName ?? 'Owner'}',
          variantType: TextVariantType.appBarTitle,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        label: TextVariant(
          tr(LocaleKeys.logout).toUpperCase(),
          variantType: TextVariantType.button,
        ),
        onPressed: () {
          AuthenticationService.injected().logout(context);
        },
      ),
    );
  }
}
