// ignore_for_file: public_member_api_docs

import 'package:app/application/routing/app.router.dart';
import 'package:app/domain/services/ui/dialog.service.dart';
import 'package:app/domain/services/ui/modal.service.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/styles/text_styles.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:app/presentation/views/widgets/buttons/secondary_button.dart';
import 'package:app/presentation/views/widgets/custom/space.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/form_fields/form_input.dart';
import 'package:app/presentation/views/widgets/utilities/icon_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'custom_card.dart';

class ComponentScaffold extends StatelessWidget {
  const ComponentScaffold({
    Key? key,
    this.appBar,
    this.primary,
    this.floatingActionButton,
  }) : super(key: key);

  final AppBar? appBar;

  final bool? primary;

  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: primary ?? true,
      appBar: appBar,
      body: ListView(
        primary: false,
        shrinkWrap: true,
        children: const <Widget>[
          _ComponentsList(),
          Space(),
          _ListText(),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class _ComponentsList extends StatelessWidget {
  const _ComponentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Shapes',
              variantType: TextVariantType.headline4,
              color: CustomColors.greyColor,
            ),
          ),
          Space(
            type: SpaceType.large,
            child: Divider(
              height: 1,
            ),
          ),
          Flexible(fit: FlexFit.loose, child: _ComponentItemButtons()),
          Space(),
          Flexible(fit: FlexFit.loose, child: _ComponentItemTextFields()),
          Space(),
          Flexible(fit: FlexFit.loose, child: _ComponentItemDialogs()),
          Space(),
          Flexible(fit: FlexFit.loose, child: _ComponentItemNavigableModals()),
          Space(),
        ],
      ),
    );
  }
}

class _ComponentItemNavigableModals extends StatelessWidget {
  const _ComponentItemNavigableModals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ComponentListItem(
      title: 'Navigation in Dialogs & Modals',
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 16,
        children: <Widget>[
          SecondaryTextButton(
            label: 'Open Dialog Screen',
            onTap: () {
              AutoRouter.of(context).root.push(const DialogScreenRoute());
            },
          ),
          SecondaryTextButton(
            label: 'Open Dialog Screen with nested navigation',
            onTap: () {
              AutoRouter.of(context).root.push(const NestedDialogScreenRoute());
            },
          ),
          SecondaryTextButton(
            label: 'Open Modal Screen',
            onTap: () {
              AutoRouter.of(context).root.push(const ModalScreenRoute());
            },
          ),
          SecondaryTextButton(
            label: 'Open Modal Screen with nested navigation',
            onTap: () {
              AutoRouter.of(context).root.push(const NestedModalScreenRoute());
            },
          ),
        ],
      ),
    );
  }
}

class _ComponentItemDialogs extends StatelessWidget {
  const _ComponentItemDialogs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ComponentListItem(
      title: 'Dialogs & Modals',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SecondaryTextButton(
            label: 'Open Dialog',
            onTap: () => _openDialog(context),
          ),
          const Space(),
          SecondaryTextButton(
            label: 'Open Modal',
            onTap: () => _openModal(context),
          ),
          const Space(),
          SecondaryTextButton(
            label: 'Open Scrollable Modal',
            onTap: () => _openScollableModal(context),
          ),
          const Space(),
          SecondaryTextButton(
            label: 'Open Scrollable Modal With Fixed Height',
            onTap: () => _openScollableModalWithMaxHeight(context),
          ),
          const Space(),
          SecondaryTextButton(
            label: 'Open Fullscreen Scrollable Modal',
            onTap: () => _openFullScreenScollableModal(context),
          ),
        ],
      ),
    );
  }

  void _openDialog(BuildContext context) {
    DialogService.showAlert(context, null, 'Body - Discard draft ?',
        actions: <DialogAction<dynamic>>[
          DialogAction<dynamic>(label: 'Button'),
          DialogAction<dynamic>(label: 'Button'),
        ]);
  }

  void _openModal(BuildContext context) {
    ModalService.showAppModalBottomSheet(
      context,
      expand: false,
      builder: (BuildContext context) {
        return ListView.builder(
          controller: ModalScrollController.of(context),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: TextVariant(index.toString()),
            );
          },
        );
      },
    );
  }

  void _openScollableModal(BuildContext context) {
    ModalService.showAppModalBottomSheet(
      context,
      expand: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const <Widget>[
                FormInput(
                  borderType: FormInputBorderType.outline,
                  labelText: 'Outline Textfield',
                ),
                Space(),
                FormInput(
                  borderType: FormInputBorderType.underline,
                  labelText: 'Underline Textfield',
                ),
                Space(),
                FormInput(
                  borderType: FormInputBorderType.outline,
                  labelText: 'Outline Textfield',
                ),
                Space(),
                FormInput(
                  borderType: FormInputBorderType.underline,
                  labelText: 'Underline Textfield',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openScollableModalWithMaxHeight(BuildContext context) {
    ModalService.showAppModalBottomSheet(
      context,
      expand: false,
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const <Widget>[
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.outline,
                    labelText: 'Outline Textfield',
                  ),
                  Space(),
                  FormInput(
                    borderType: FormInputBorderType.underline,
                    labelText: 'Underline Textfield',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openFullScreenScollableModal(BuildContext context) {
    ModalService.showAppModalBottomSheet(
      context,
      expand: true, // Important for fullscreen
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const <Widget>[
              FormInput(
                borderType: FormInputBorderType.outline,
                labelText: 'Outline Textfield',
              ),
              Space(),
              FormInput(
                borderType: FormInputBorderType.underline,
                labelText: 'Underline Textfield',
              ),
              FormInput(
                borderType: FormInputBorderType.outline,
                labelText: 'Outline Textfield',
              ),
              Space(),
              FormInput(
                borderType: FormInputBorderType.underline,
                labelText: 'Underline Textfield',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ComponentItemTextFields extends StatelessWidget {
  const _ComponentItemTextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ComponentListItem(
      title: 'TextFields',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          FormInput(
            borderType: FormInputBorderType.outline,
            labelText: 'Outline Textfield',
          ),
          Space(),
          FormInput(
            borderType: FormInputBorderType.underline,
            labelText: 'Underline Textfield',
          ),
        ],
      ),
    );
  }
}

class _ComponentItemButtons extends StatelessWidget {
  const _ComponentItemButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ComponentListItem(
      title: 'Buttons',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              //
            },
            child: const Icon(Icons.add),
          ),
          PrimaryTextButton(
            label: 'Button',
            onTap: () {
              //
            },
          ),
          SecondaryButton(
            child: const IconText(
              icon: Icon(Icons.check),
              text: TextVariant(
                'Button Check',
                variantType: TextVariantType.button,
              ),
              iconFirst: true,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _ComponentListItem extends StatelessWidget {
  const _ComponentListItem({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  /// title
  final String title;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: TextVariant(
            title,
            variantType: TextVariantType.headline6,
          ),
        ),
        const Space(
          type: SpaceType.small,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: child,
        ),
      ],
    );
  }
}

class _ListText extends StatelessWidget {
  const _ListText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Typography',
              variantType: TextVariantType.headline4,
              color: CustomColors.greyColor,
            ),
          ),
          const Space(
            type: SpaceType.large,
            child: Divider(
              height: 1,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H1/${TextStyles.headline1Style(context: context).fontFamily!}/${TextStyles.headline1Style(context: context).fontSize!}sp/${TextStyles.headline1Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.headline1,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H2/${TextStyles.headline2Style(context: context).fontFamily!}/${TextStyles.headline2Style(context: context).fontSize!}sp/${TextStyles.headline2Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.headline2,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H3/${TextStyles.headline3Style(context: context).fontFamily!}/${TextStyles.headline3Style(context: context).fontSize!}sp/${TextStyles.headline3Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.headline3,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H4/${TextStyles.headline4Style(context: context).fontFamily!}/${TextStyles.headline4Style(context: context).fontSize!}sp/${TextStyles.headline4Style(context: context).letterSpacing!}letter-spacing',
              variantType: TextVariantType.headline4,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H5/${TextStyles.headline5Style(context: context).fontFamily!}/${TextStyles.headline5Style(context: context).fontSize!}sp/${TextStyles.headline5Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.headline5,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'H6/${TextStyles.headline6Style(context: context).fontFamily!}/${TextStyles.headline6Style(context: context).fontSize!}sp/${TextStyles.headline5Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.headline6,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Subtitle1/${TextStyles.subtitle1Style(context: context).fontFamily!}/${TextStyles.subtitle1Style(context: context).fontSize!}sp/${TextStyles.subtitle1Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.subtitle1,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Subtitle2/${TextStyles.subtitle2Style(context: context).fontFamily!}/${TextStyles.subtitle2Style(context: context).fontSize!}sp/${TextStyles.subtitle2Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.subtitle2,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Body 1/${TextStyles.bodyText1Style(context: context).fontFamily!}/${TextStyles.bodyText1Style(context: context).fontSize!}sp/${TextStyles.bodyText1Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.body1,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            child: TextVariant(
              'Body 2/${TextStyles.bodyText2Style(context: context).fontFamily!}/${TextStyles.bodyText2Style(context: context).fontSize!}sp/${TextStyles.bodyText2Style(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.body2,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Button/${TextStyles.buttonStyle(context: context).fontFamily!}/${TextStyles.buttonStyle(context: context).fontSize!}sp/${TextStyles.buttonStyle(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.button,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Caption/${TextStyles.captionStyle(context: context).fontFamily!}/${TextStyles.captionStyle(context: context).fontSize!}sp/${TextStyles.captionStyle(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.body2,
            ),
          ),
          const Space(
            type: SpaceType.large,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: TextVariant(
              'Overline/${TextStyles.overlineStyle(context: context).fontFamily!}/${TextStyles.overlineStyle(context: context).fontSize!}sp/${TextStyles.overlineStyle(context: context).letterSpacing!} letter-spacing',
              variantType: TextVariantType.overline,
            ),
          ),
        ],
      ),
    );
  }
}

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: <Widget>[
          const TextVariant('Yeah am dialog screen',
              variantType: TextVariantType.headline3),
          PrimaryTextButton(
            label: 'Close me',
            onTap: () {
              AutoRouter.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

class ModalScreen extends StatelessWidget {
  const ModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context), // required to pass our theme to Material
      child: Material(
        // required cause we use Material component
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: <Widget>[
              const TextVariant('Yeah am modal screen with Input ^^',
                  variantType: TextVariantType.headline3),
              const FormInput(
                borderType: FormInputBorderType.outline,
                labelText: 'Outline Textfield',
              ),
              SecondaryTextButton(
                label: 'Open dialog screen',
                onTap: () {
                  AutoRouter.of(context).root.push(const DialogScreenRoute());
                },
              ),
              SecondaryTextButton(
                label: 'Open another modal',
                onTap: () {
                  AutoRouter.of(context).root.push(const ModalScreenRoute());
                },
              ),
              PrimaryTextButton(
                label: 'Close me',
                onTap: () {
                  AutoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NestedModalScreen extends StatelessWidget {
  const NestedModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (BuildContext context, Widget content) => content,
    );
  }
}

class NestedModalScreenFirst extends StatelessWidget {
  const NestedModalScreenFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextVariant('First nested modal'),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: <Widget>[
          const TextVariant('Yeah am modal screen with Input ^^',
              variantType: TextVariantType.headline3),
          const FormInput(
            borderType: FormInputBorderType.outline,
            labelText: 'Outline Textfield',
          ),
          SecondaryTextButton(
            label: 'Go to nested page',
            onTap: () {
              if (AutoRouter.of(context).routeData.name ==
                  NestedDialogScreenRoute.name) {
                AutoRouter.of(context)
                    .push(const NestedDialogScreenSecondRoute());
              } else {
                AutoRouter.of(context)
                    .push(const NestedModalScreenSecondRoute());
              }
            },
          ),
          PrimaryTextButton(
            label: 'Close me',
            onTap: () {
              AutoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class NestedModalScreenSecond extends StatelessWidget {
  const NestedModalScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextVariant('Sedond nested modal'),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: <Widget>[
          const TextVariant('Yeah am modal screen with Input ^^',
              variantType: TextVariantType.headline3),
          const FormInput(
            borderType: FormInputBorderType.outline,
            labelText: 'Outline Textfield',
          ),
          PrimaryTextButton(
            label: 'Go back',
            onTap: () {
              AutoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
