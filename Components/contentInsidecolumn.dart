import 'package:flutter/material.dart';
import '../constant.dart';

class Detail extends StatelessWidget {
  final IconData type;
  final String name;
  Detail({@required this.type, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          type,
          color: Color(0xFF8D8E98),
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          name,
          style: kstyling,
        )
      ],
    );
  }
}
