import 'package:flutter/material.dart';

import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';class contactslist extends StatelessWidget {
  final List<User> users;
  const contactslist({  @required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("contacts",style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w500,

                ),)),
                Icon(Icons.search,color: Colors.grey[600],),
                const SizedBox(width: 8,),
                Icon(Icons.more_horiz,color: Colors.grey[600],),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (BuildContext context,int index)
              {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: usercard(currentuser: user),
                );
          
              }
               ),
          )
        ],
      ),

      
    );
  }
}