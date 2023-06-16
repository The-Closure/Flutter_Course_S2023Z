import 'package:flutter/material.dart';
import 'package:plan_and_go/view/res/color.dart';
import 'package:plan_and_go/view/res/string.dart';

Widget myTextField(TextEditingController data) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
    child: TextField(
      controller:data ,
      decoration: InputDecoration(
        label: Row(children: [
          Icon(Icons.search, color: GREY, size: 40),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              ConstString.SEARCH,
              style: TextStyle(color: GREY, fontSize: 18),
            ),
          )
        ]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
