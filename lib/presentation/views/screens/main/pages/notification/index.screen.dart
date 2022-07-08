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
    return model.locked?const Center(child:CircularProgressIndicator()):model.challenges.isEmpty? const Center(
      child: Text('No notifs'),
    ):RefreshIndicator(child: ListView.separated(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), itemBuilder: (BuildContext context, int index)=>model.getCorrectNotificationWidget(index), separatorBuilder: (BuildContext context, int index)=>SizedBox(
      height: index == model.challenges.length - 1 ? 0 : 20,
    ), itemCount: model.locked? model.challenges.length+1:model.challenges.length), onRefresh: () async => model.loadData(refresh: true));

  }
}
