import 'package:app/presentation/viewmodels/main/pages/notification.viewmodel.dart';
import 'package:app/presentation/views/widgets/utilities/infinite_scrollview.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationViewModel?.buildWithProvider(
        builder: (context, widget) => const _NotificationBody());
  }
}

class _NotificationBody extends StatelessWidget {
  const _NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationViewModel model = NotificationViewModel?.provide(context);
    return InfiniteScrollview(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        isLoading: model.locked,
        loadingBuilder: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()),
        emptyBuilder: (BuildContext context) => const Center(
              child: Text('No notifs'),
            ),
        onRefresh: () async => model.loadData(refresh: true),
        children: List.generate(
            model.challenges.length,
            (index) => Column(children: [
                  model.getCorrectNotificationWidget(index),
                  SizedBox(
                    height: index == model.challenges.length - 1 ? 0 : 20,
                  )
                ])));
  }
}
