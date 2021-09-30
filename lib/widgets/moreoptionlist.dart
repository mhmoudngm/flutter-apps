import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class moreoptionlist extends StatelessWidget {
  final User currentuser;
  final List<List> moreoption =[
    [MdiIcons.shieldAccount,Colors.deepPurple,'Covid-19 Info Center'],
    [MdiIcons.accountMultiple,Colors.cyan,'Friends'],
    [MdiIcons.facebookMessenger,Palette.facebookBlue,'Messenger'],
    [MdiIcons.flag,Colors.orange,'Flags'],
    [MdiIcons.storefront,Palette.facebookBlue,'MarketPlace'],
    [MdiIcons.calendarStar,Colors.red,'Events'], 
    [Icons.ondemand_video,Palette.facebookBlue,'Watch'],
  ];

   moreoptionlist({@required this.currentuser});
 

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 280
      ),
      child: ListView.builder(
        itemCount: 1 + moreoption.length,
        itemBuilder: (BuildContext context ,int index)
        {
          if(index == 0)
          {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
            child: usercard(currentuser:currentuser),
            
            );
          }
          final List option = moreoption[index - 1];
          return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
            child: _option(
              icon:option[0],
              color:option[1],
              label:option[2]
            )
            
            );
        }
        
        ),
      
    );
  }
}

class  _option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _option({@required this.icon,@required this.color,@required this.label});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>print(label),
      child: Row(
        children: [
          Icon(icon,size:38,color:color),
          const SizedBox(width: 6,),
          Flexible(child: Text(label,style: TextStyle(fontSize:16,),overflow: TextOverflow.ellipsis)
          )]
      ),
      
    );
  }
}