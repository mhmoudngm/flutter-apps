import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavater.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';

class rooms extends StatelessWidget {
  final List<User> onlineusers;

  const rooms({@required this.onlineusers});

  @override
  Widget build(BuildContext context) {
   final bool isdesktop = resposive.isdesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isdesktop ? 5:0),
      shape: isdesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)):null,
      child: Container(
        color: Colors.white,
        height: 60,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineusers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: create_room_button()
                );
              }
              final User user = onlineusers[index - 1];
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: profileavater(
                    imageurl: user.imageUrl,
                    isactive: true,
                  ));
            }),
      ),
    );
  }
}

class create_room_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      
      onPressed: () => print("room button"),
      
      style:  OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)) ),
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.blueAccent[100], width: 3),
        textStyle: TextStyle(
          color: Palette.facebookBlue
        ),
          
      ),
      child: Row(
        children: [
          Icon(
            Icons.video_call,
            color: Colors.purple,
            size: 35,
          ),
          const SizedBox(width:5),
          Text("Create\nRoom")
        ],
      ),
    );
  }
}
