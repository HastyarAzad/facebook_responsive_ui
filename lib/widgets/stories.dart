import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _StoryCard(
                currentUser: currentUser,
                isAddStory: true,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _StoryCard(story: stories[index - 1]),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final Story story;
  final User currentUser;

  const _StoryCard({
    Key key,
    this.isAddStory = false,
    this.story,
    this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 100,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Image(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                  isAddStory ? currentUser.imageUrl : story.imageUrl),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: Palette.storyGradient,
          ),
        ),
        Positioned(
          top: 5,
          left: 10,
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: (!isAddStory && !story.isViewed)
                  ? Border.all(
                      width: 2,
                      color: Colors.lightBlue[200],
                    )
                  : null,
              color: Colors.white,
            ),
            child: isAddStory
                ? IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 25.0,
                    color: Palette.facebookBlue,
                    onPressed: () {
                      print('Add story');
                    },
                  )
                : ProfileAvatar(imageUrl: story.user.imageUrl),
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? "add to story" : "${story.user.name}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
