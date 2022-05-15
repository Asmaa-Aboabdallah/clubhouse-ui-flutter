import 'dart:ui';

import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/room_screen.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  // const RoomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0), // spaces between cards
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Padding( //spaces inside card
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ), // change in theme which created in the beginning of app
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        // Use stack to layers things
                        child: Stack(children: [
                          UserProfileImage(
                            imageUrl: room.speakers[1].imageUrl,
                            size: 48.0,
                          ),
                          // Use positioned to modify two layers
                          Positioned(
                            left: 28.0,
                            top: 24.0,
                            child: UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 48.0,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map(
                              (e) => Text(
                                '${e.firstName} ${e.lastName} 💬',
                                style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 16.0,
                                        ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            // Text.rich (TextSpan(children: [TextSpan(), WidgetSpan(),]))
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.others.length}  '
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                      text:
                                      '  /   ${room.speakers.length}  '
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
