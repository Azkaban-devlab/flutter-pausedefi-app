import 'package:app/domain/services/injected/room.service.dart';
import 'package:flutter/material.dart';

class ChallengeMainScreen extends StatelessWidget {
  const ChallengeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(RoomService.injected().room?.challenges != null
            ? (RoomService.injected().room?.challenges?[0].title ??
                'Challenges')
            : 'Challenge'));
  }
}
