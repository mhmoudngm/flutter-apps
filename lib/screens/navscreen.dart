import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/customtabbar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/custonappbar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class navscreen extends StatefulWidget {
  //const navscreen({ Key? key }) : super(key: key);

  @override
  _navscreenState createState() => _navscreenState();
}

class _navscreenState extends State<navscreen> {
  final List<Widget> screens = [
    home_screen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu
  ];
  int selectindex = 0;
 
    @override
  Widget build(BuildContext context) {
     final Size screensize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar: resposive.isdesktop(context)?
        PreferredSize(child: customappbar(
          currentuser:currentUser,
          icon:icons,
          selectedindex:selectindex,
          ontap:(index)=> setState(()=> selectindex = index)
          ),
           preferredSize: Size(screensize.width, 100)):null,
        body: screens[selectindex],
        bottomNavigationBar: !resposive.isdesktop(context ) ?
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: customtabbar(

            icons:icons,
            selectindex:selectindex,
            ontap:(index)=> setState(()=> selectindex = index)
            ),
        ): const SizedBox.shrink()
      ),
      
    );
  }
}