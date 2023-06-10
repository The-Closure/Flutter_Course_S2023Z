import 'package:flutter/material.dart';
import 'package:plan_and_go/view/res/color.dart';

Widget specialButton(String activeText, Function onTapping) {
  return Padding(
    padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
    child: InkWell(child: Container(
      width: 314,height: 54,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: SecondaryColor,),
      child: Center(child: Text(activeText,style: TextStyle(fontSize: 18,color:WHITE )),),
    ), onTap: onTapping()),
  );
}
