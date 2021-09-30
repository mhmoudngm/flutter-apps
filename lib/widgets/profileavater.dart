import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
class profileavater extends StatelessWidget {
  final String imageurl;
  final bool isactive;
  final bool hasborder;

  const profileavater({
    @required this.imageurl,
    this.isactive = false,
    this.hasborder = false,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasborder? 17:20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageurl),
          ),
        ),
       isactive? Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color:Palette.online,
              shape: BoxShape.circle,
                border: Border.all(width: 2,color: Colors.white)
            ),
          ),

        ):
           const SizedBox.shrink(),
      ],
    );
  }
}
