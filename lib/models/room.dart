import 'package:clubhouse_ui/models/users.dart';

class Room {
  final String club;
  final String name;
  final List<User> speakers;
  final List<User> followedBySpeakers;
  final List<User> others;

  const Room({
    required this.club, // must assign value
    required this.name, // must assign value
    this.speakers = const [], // empty list
    this.followedBySpeakers = const [], // empty list
    this.others = const [], // empty list
});
}
