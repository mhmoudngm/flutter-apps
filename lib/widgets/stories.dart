import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavater.dart';

class Stories extends StatelessWidget {
  final User currentuser;
  final List<Story> stories;

  const Stories({@required this.currentuser, @required this.stories});

  @override
  Widget build(BuildContext context) {
    print(currentuser.imageUrl);
    print(stories[1].imageUrl);

    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length ,
        itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: storycard(isaddstory: true, currentuser: currentuser),
          );
        }
          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: storycard(story: story),
          );
        },
      ),
    );
  }
}
class storycard extends StatelessWidget {
  final bool isaddstory;
  final User currentuser;
  final Story story;

  const storycard({
    this.isaddstory = false,
    this.currentuser,
    this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isaddstory ? currentuser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isaddstory
              ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Palette.facebookBlue,
              onPressed: () => print('Add to Story'),
            ),
          )
              : profileavater(
            imageurl: story.user.imageUrl,
            hasborder: !story.isViewed,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isaddstory ? 'Add to Story' : story.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

