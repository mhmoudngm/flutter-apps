import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
class customtabbar extends StatelessWidget {
  final List<IconData> icons;
  final int selectindex;
  final Function ontap;
  final bool isbottomindictor;

  const customtabbar({ this.isbottomindictor = false, @required this.icons, @required this.selectindex,@required this.ontap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      //indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: isbottomindictor ? Border(
          bottom: BorderSide(
            color: Palette.facebookBlue,
            width:3, 
            ),
        ):
        Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width:3, 
            ),

      ),),
      tabs: icons.asMap().map((i,e) => 
        MapEntry(i, Tab(
        icon: Icon(e,color: i==selectindex? Palette.facebookBlue:Colors.black26),
      )
      )).values.toList(),
      onTap: ontap,

      
    );
  }
}