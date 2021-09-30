import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/stories.dart';
import 'package:flutter_facebook_responsive_ui/widgets/usercard.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'customtabbar.dart';

class customappbar extends StatelessWidget {
  final User currentuser;
  final List<IconData> icon;
  final Function(int) ontap;
  final int selectedindex;

  const customappbar(
      {@required this.currentuser,
      @required this.icon,
      @required this.ontap,
      @required this.selectedindex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: customtabbar(
                icons: icon,
                ontap: ontap,
                isbottomindictor: true,
                selectindex: selectedindex
                ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                usercard(
                  currentuser: currentuser,
                ),
                const SizedBox(width: 12),
                circle_button(
                    icon: Icons.search,
                    iconsize: 30,
                    onpressed: () => print("search")),
                circle_button(
                    icon: MdiIcons.facebookMessenger,
                    iconsize: 30,
                    onpressed: () => print("messenger"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
