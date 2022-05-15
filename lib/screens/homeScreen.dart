import 'dart:io';
import 'dart:ui';
import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widgets/room_card.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.envelope_open,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.calendar,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 28,
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
      body: Stack(
        alignment: Alignment.center,
        // any thing inside stack will be in the center of the screen
        children: [
          ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100),
              children: [...roomList.map((e) => RoomCard(room: e))]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.1), //to make it transperent 'شفاف'
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                size: 21,
                color: Colors.white,
              ),
              label: Text(
                'Start a room',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                primary: Theme.of(context).accentColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
