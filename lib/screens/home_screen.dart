import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/contactslist.dart';
import 'package:flutter_facebook_responsive_ui/widgets/create_post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/moreoptionlist.dart';
import 'package:flutter_facebook_responsive_ui/widgets/posts_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter_facebook_responsive_ui/widgets/rooms.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_responsive_ui/widgets/stories.dart';



class home_screen  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<home_screen> {
  final TrackingScrollController trackingScrollController = TrackingScrollController();
  void dispose(){
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
    child: Scaffold(
      body: resposive(
        mobile: homescreenmobile(ScrollController:trackingScrollController),
       desktop: homescreendesktop(ScrollController:trackingScrollController))
    ));
    }}

class homescreenmobile extends StatelessWidget {
final TrackingScrollController ScrollController;

  const homescreenmobile({@required this.ScrollController}) ;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController,
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text("facebook",style: TextStyle(color: Palette.facebookBlue,fontSize: 28,fontWeight: FontWeight.bold,letterSpacing: -1.2 )),
            centerTitle: false,
            floating: true,
            actions: [
              circle_button(icon: Icons.search, iconsize: 30, onpressed: ()=>print("search")),
              circle_button(icon: MdiIcons.facebookMessenger, iconsize: 30, onpressed: ()=>print("messenger"))
            ],
          ),
          SliverToBoxAdapter(
            child: create_post_container(current_user: currentUser,),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: rooms(onlineusers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(currentuser: currentUser,stories: stories)//.catchError((Object error) {return null;}),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
            final Post post = posts[index];
            return posts_container(post: post);
          },
            childCount:posts.length,
          )

      ),
    ]);
  }
}






class homescreendesktop extends StatelessWidget {
  final TrackingScrollController ScrollController;
  final List<User> users;

  const homescreendesktop({@required this.ScrollController,@required this.users});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.all(12),
             child: moreoptionlist(currentuser:currentUser),
             ),
            ),
        ),
        const Spacer(),
          Container(
          child: CustomScrollView(
            controller: ScrollController,
        slivers: [
          
          SliverToBoxAdapter(
            child: create_post_container(current_user: currentUser,),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: rooms(onlineusers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(currentuser: currentUser,stories: stories)//.catchError((Object error) {return null;}),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
            final Post post = posts[index];
            return posts_container(post: post);
          },
            childCount:posts.length,
          )

      ),
    ]),
          width: 600,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: contactslist(users:onlineUsers)
          )
      ],
      
    );
  }
}
