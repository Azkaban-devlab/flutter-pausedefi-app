import 'package:app/application/routing/app.router.dart';
import 'package:app/domain/services/injected/authentication.service.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/presentation/styles/colors.dart';
import 'package:app/presentation/viewmodels/main/main.viewmodel.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
import 'package:app/presentation/views/widgets/utilities/icon/pause_defi_icon_icons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///
/// [MainScreen]
///
class MainScreen extends StatelessWidget {
  ///
  /// Constructor
  ///
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainViewModel?.buildWithProvider(
        builder: (context, widget) => _MainBody());
  }
}

class _MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        appBarBuilder: (BuildContext context, TabsRouter? tabsRouter) => AppBar(
              leading: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => RoomService.injected().exitRoom(context),
                icon: const Icon(
                  Icons.door_back_door,
                  color: Colors.white,
                ),
              ),
              title: TextVariant(
                appBarTitle(tabsRouter!.activeIndex).toUpperCase(),
                variantType: TextVariantType.appBarTitle,
                color: Colors.white,
              ),
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
              actions: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () =>
                        AuthenticationService.injected().logout(context),
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))
              ],
            ),
        routes: const <PageRouteInfo<dynamic>>[
          FeedScreenRoute(),
          ChallengeMainScreenRoute(),
          RankingScreenRoute(),
          NotificationScreenRoute()
        ],
        bottomNavigationBuilder: (_, TabsRouter tabsRouter) => Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: CustomColors.silver))),
              child: BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        PauseDefiIcon.target,
                        size: 20,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(PauseDefiIcon.ranking, size: 20), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none_outlined), label: ''),
                ],
              ),
            ));
  }

  String appBarTitle(int index) {
    switch (index) {
      case 0:
        return "Fil d'actualité";
      case 1:
        return 'Défis';
      case 2:
        return 'Classement';
      case 3:
        return 'Notifications';
      default:
        return '';
    }
  }
}
