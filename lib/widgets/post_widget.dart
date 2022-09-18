
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Posts extends StatelessWidget {
  final Post post;

  const Posts({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imageUrl: post.user.imageUrl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.user.name),
                        RichText(
                          text: TextSpan(
                            style:
                                TextStyle(color: Colors.grey, wordSpacing: 1),
                            children: [
                              TextSpan(text: post.timeAgo),
                              TextSpan(
                                text: " .",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              WidgetSpan(
                                  child: Icon(Icons.public_outlined, size: 14)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 8.0, right: 0, bottom: 8.0),
            child: Text(post.caption),
          ),
          (post.imageUrl != null)
              ? Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  child: Image(
                    image: CachedNetworkImageProvider(post.imageUrl),
                  ),
                )
              : SizedBox.shrink(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Palette.facebookBlue),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                    size: 10.0,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "${post.comments} Comments",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(width: 5),
              Text(
                "${post.shares} Shares",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  print("like");
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[600]),
                    children: [
                      WidgetSpan(
                        child: Icon(MdiIcons.thumbUpOutline,
                            size: 20, color: Colors.grey[600]),
                      ),
                      TextSpan(text: " Like"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Comment");
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[600]),
                    children: [
                      WidgetSpan(
                        child: Icon(MdiIcons.commentOutline,
                            size: 20, color: Colors.grey[600]),
                      ),
                      TextSpan(text: " Comment"),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("Share");
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey[600]),
                    children: [
                      WidgetSpan(
                        child: Icon(MdiIcons.shareOutline,
                            size: 20, color: Colors.grey[600]),
                      ),
                      TextSpan(text: " Share"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
