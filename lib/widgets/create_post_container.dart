import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavater.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
class create_post_container extends StatelessWidget {
  final User current_user;
  const create_post_container({
    @required this.current_user});

  @override
  Widget build(BuildContext context) {
    final bool isdesktop = resposive.isdesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isdesktop ? 5:0),
      shape: isdesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)):null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                profileavater(imageurl: current_user.imageUrl),
                const SizedBox(width: 8.0,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: ("what is on your mind ?")
    
                  ),),
                )
              ],
            ),
            const Divider(height: 10,thickness: .5,),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: ()=>print("live"),
                    icon:Icon(Icons.videocam,color: Colors.red),
                    label:Text("Live"),
                  ),
                  const VerticalDivider(width: 8,),
                  FlatButton.icon(
                    onPressed: ()=>print("photo"),
                    icon:Icon(Icons.photo_library,color: Colors.green),
                    label:Text("photo"),
                  ),
                  const VerticalDivider(width: 8,),
                  FlatButton.icon(
                    onPressed: ()=>print("Room"),
                    icon:Icon(Icons.video_call,color: Colors.purpleAccent),
                    label:Text("Room"),
                  ),
    
    
    
    
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
