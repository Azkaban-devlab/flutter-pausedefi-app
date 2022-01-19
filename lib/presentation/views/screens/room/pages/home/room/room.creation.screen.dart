import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/home/room/room.creation.viewmodel.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/pages/room.challenge.page.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/pages/room.code.page.dart';
import 'package:app/presentation/views/screens/room/pages/home/room/pages/room.name.page.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:flutter/material.dart';

class RoomCreationScreen extends StatelessWidget {
  const RoomCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoomCreationViewModel?.buildWithProvider(
        builder: (_, __) => _RoomCreationBody());
  }
}

class _Indicator extends StatelessWidget {
  final int currentIndex;
  final int stepNumber;
  const _Indicator(this.currentIndex, this.stepNumber);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == stepNumber - 1
              ? AppColors.primaryVariantColor
              : AppColors.primaryColor,
          border: Border.all(color: AppColors.primaryColor)),
      child: Center(
          child: TextVariant(
        '$stepNumber',
        variantType: TextVariantType.headline5,
        color: Colors.white,
      )),
    );
  }
}

class _RoomCreationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RoomCreationViewModel model = RoomCreationViewModel.provide(context);
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => model.navigateBackPage(context),
          ),
          title: const TextVariant(
            'Créer un salon',
            variantType: TextVariantType.appBarTitle,
          ),
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      _Indicator(model.currentIndex, 1),
                      Flexible(
                          child: LinearProgressIndicator(
                        value: model.firstTransition,
                        minHeight: 2,
                        backgroundColor: AppColors.primaryColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryVariantColor),
                      )),
                      _Indicator(model.currentIndex, 2),
                      Flexible(
                          child: LinearProgressIndicator(
                        value: model.secondTransition,
                        minHeight: 2,
                        backgroundColor: AppColors.primaryColor,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primaryVariantColor),
                      )),
                      _Indicator(model.currentIndex, 3),
                    ],
                  ))),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              flex: 12,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) => model.startTransition(index),
                controller: model.pageController,
                children: const [
                  RoomNamePage(),
                  RoomChallengePage(),
                  RoomCodePage(),
                ],
              ))
        ]));
  }
}
