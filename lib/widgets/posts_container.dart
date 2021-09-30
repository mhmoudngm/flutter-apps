import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavater.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class posts_container extends StatelessWidget {
  final Post post;
  const posts_container({@required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isdesktop = resposive.isdesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isdesktop ? 5:0,vertical: 5),
      shape: isdesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)):null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  postheader(post: post),
                  const SizedBox(height: 4),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: post.imageUrl.length>=2? CarouselSlider(
                      items: [
                      
                      CachedNetworkImage(imageUrl: post.imageUrl[0]),
                       CachedNetworkImage(imageUrl: post.imageUrl[1])
                        
                      ],
                      options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(seconds: 2)
                      ),
                    
                    ):
                    CachedNetworkImage(imageUrl: post.imageUrl[0])
                    )
                   
                  
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: poststate(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class postheader extends StatelessWidget {
  final Post post;
  const postheader({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          profileavater(imageurl: post.user.imageUrl),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${post.user.name}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo}',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    Icon(
                      Icons.public,
                      color: Colors.grey[400],
                      size: 12,
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () => print("more"), icon: Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}

class poststate extends StatelessWidget {
  final Post post;

  const poststate({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              )),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              '${post.likes}Likes',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Text(
            '${post.comments}Comments',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(width: 8),
          Text(
            '${post.shares}Shares',
            style: TextStyle(color: Colors.grey[600]),
          )
        ]),
        const Divider(),
        Row( 
          children: [
            postbutton(
                icon: Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600],size:20),
                label: 'like',
                ontap:()=>print('like')),
                postbutton(
                icon: Icon(MdiIcons.comment, color: Colors.grey[600],size:20),
                label: 'Comment',
                ontap:()=>print('comment')),
                postbutton(
                icon: Icon(MdiIcons.share, color: Colors.grey[600],size:25),
                label: 'Share',
                ontap:()=>print('share')),
          ],
        )
      ],
    );
  }
}

class postbutton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function ontap;

  const postbutton({Key key, @required this.icon,@required this.label,@required this.ontap}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color:Colors.white,
        child: InkWell(
          onTap: ontap,
          child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4,),
                Text(label),
              ],
            ),
      
          )
        ),
      ),
    );



  }}

