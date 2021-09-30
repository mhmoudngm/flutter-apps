import 'package:flutter/material.dart';
class circle_button extends StatelessWidget {

  final IconData icon;
  final double iconsize;
  final Function onpressed;

  const circle_button({
    @required this.icon,
    @required   this.iconsize,
    @required this.onpressed}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(icon),
        iconSize: iconsize,
        color: Colors.black,
      ),
    );
  }
}
