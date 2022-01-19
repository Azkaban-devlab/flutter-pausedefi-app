import 'package:app/domain/services/injected/room.service.dart';
import 'package:app/presentation/views/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(RoomService.injected().room?.name ?? 'Feed'),
    );
  }
}
