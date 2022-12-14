import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'what\'s on your mind?'),
                ),
              ),
            ],
          ),
          Divider(
            height: 12.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    print('live');
                  },
                  icon: Icon(Icons.videocam, color: Colors.red),
                  label: Text(
                    "Live",
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () {
                    print('photo');
                  },
                  icon: Icon(Icons.photo_library, color: Colors.green),
                  label: Text("Photo",
                      style: TextStyle(fontSize: 17.0, color: Colors.black)),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () {
                    print('Room');
                  },
                  icon: Icon(Icons.video_call, color: Colors.purpleAccent),
                  label: Text("Room",
                      style: TextStyle(fontSize: 17.0, color: Colors.black)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
