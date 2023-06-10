import 'package:flutter/material.dart';
import 'package:plan_and_go/view/res/string.dart';

import '../res/color.dart';

class OnBooarderText extends StatelessWidget {
  const OnBooarderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Text(
     ConstString.WRITELISTS,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: BLACK
      ),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(51, 0, 30, 0),
      child: Text(ConstString.WRITEYOURTASKS,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: GREY)),
    ),
        ],
      );
  }
}

