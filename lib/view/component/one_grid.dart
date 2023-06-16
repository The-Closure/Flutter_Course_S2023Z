import 'package:flutter/material.dart';
import 'package:plan_and_go/view/component/top_text.dart';
import 'package:plan_and_go/view/res/color.dart';
import 'package:plan_and_go/view/res/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local_data/local_storage.dart';

class OneGrid extends StatelessWidget {
  const OneGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        width: 142,
        child: Card(
          child: Container(
            width: 142,
            height: 120,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(child: topText(myMagic.get<SharedPreferences>().getString('key') ?? "10", "5", BLACK)),
                Center(
                  child: Container(
                    width: 116,
                    height: 5,
                    color: GREY,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
