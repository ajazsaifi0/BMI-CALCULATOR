import 'package:flutter/material.dart';
import '../Screen/input_page.dart';

class NewWidget extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function gest;
  NewWidget({@required this.colour, this.cardChild, this.gest});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gest,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
