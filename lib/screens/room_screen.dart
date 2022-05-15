import 'dart:math';
import 'dart:ui';

import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/room_user_profile.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  //const RoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('Hallway'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.doc,
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Hello");
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfileImage(
                size: 34.0,
                imageUrl: currentUser.imageUrl,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: CustomScrollView(
            slivers: [
              //////////////Speakers
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${room.club} 🏠'.toUpperCase(),
                            style:
                                Theme.of(context).textTheme.overline!.copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.0,
                                    ),
                          ),
                          Icon(CupertinoIcons.ellipsis),
                        ],
                      ),
                    ),
                    Text(
                      room.name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(14.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15.0,
                  children: room.speakers
                      .map((e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.firstName,
                            Size: 66,
                            isNew: Random().nextBool(),
                            isMuted: Random().nextBool(),
                          ))
                      .toList(),
                ),
              ),
              ///////Followed by speakers
              SliverToBoxAdapter(
                child: Text(
                  'Followed by Speakers',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 14.0,
                        color: Color(0xFFD4D4CF),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(14.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15.0,
                  children: room.followedBySpeakers
                      .map((e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.firstName,
                            Size: 66,
                            isNew: Random().nextBool(),
                          ))
                      .toList(),
                ),
              ),
              ////////Others
              SliverToBoxAdapter(
                child: Text(
                  'Others in the room',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 14.0,
                        color: Color(0xFFD4D4CF),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(14.0),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 15.0,
                  children: room.others
                      .map((e) => RoomUserProfile(
                            imageUrl: e.imageUrl,
                            name: e.firstName,
                            Size: 66,
                            isNew: Random().nextBool(),
                          ))
                      .toList(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 50),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌ Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[200],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
