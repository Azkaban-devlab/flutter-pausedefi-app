import 'package:app/application/routing/app.router.dart';
import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/presentation/views/screens/main/pages/feed/index.screen.dart';
import 'package:app/presentation/views/widgets/custom/text_variant.dart';
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
    return AutoTabsScaffold(
      appBarBuilder: (BuildContext context, TabsRouter? tabsRouter) => AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => RoomService.injected().exitRoom(context),
          icon: const Icon(Icons.door_back_door),
        ),
        title: TextVariant(appBarTitle(tabsRouter!)),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => print('TODO navigate settings'),
              icon: const Icon(Icons.settings))
        ],
      ),
      routes: const <PageRouteInfo<dynamic>>[
        FeedScreenRoute(),
        ChallengeMainScreenRoute(),
        RankingScreenRoute(),
        NotificationScreenRoute()
      ],
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) =>
          BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: (int value) => tabsRouter.setActiveIndex(value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined), label: ''),
        ],
      ),
    );
  }

  String appBarTitle(TabsRouter tabsRouter) {
    switch (tabsRouter.activeIndex) {
      case 0:
        return 'Feed';
      case 1:
        return 'Défi';
      case 2:
        return 'Classement';
      case 3:
        return 'Notifications';
      default:
        return '';
    }
  }
}
