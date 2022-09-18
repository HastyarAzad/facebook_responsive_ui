import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTab;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: icons
          .asMap()
          .map((index, e) => MapEntry(
                index,
                Tab(
                  icon: Icon(
                    e,
                    color: index == selectedIndex? Palette.facebookBlue: Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTab,
    );
  }
}
