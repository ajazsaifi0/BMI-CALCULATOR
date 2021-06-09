import 'package:flutter/material.dart';

import '../Screen/input_page.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF121314),
          scaffoldBackgroundColor: Color(0xFF121314),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
