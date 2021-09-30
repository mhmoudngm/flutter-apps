import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class usercard extends StatelessWidget {
  final User currentuser;
  const usercard({ @required this.currentuser}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            profileavater(imageurl: currentuser.imageUrl),
            const SizedBox(width: 6,),
            Flexible(
              child: Text(currentuser.name,style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              ),

              )
          ],
        ),
      ),
      
    );
  }
}