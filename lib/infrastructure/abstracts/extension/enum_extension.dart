import 'package:app/domain/data/models/challenge.model.dart';

extension ParseChallengeStateToString on ChallengeState {
  String toShortString() {
    return toString().split('.').last;
  }
}
