


import 'package:flutter/material.dart';
import 'package:plan_and_go/view/res/color.dart';
import 'package:plan_and_go/view/res/string.dart';

Widget topText(String taskValue , String completedTask,Color editingColor ){
return     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstString.TOPTEXT,
                style: TextStyle(
                    color: editingColor  ,fontSize: 34),
              ),
              Row(
                children:[
                  Text(taskValue ,style: TextStyle(
                    color: GREY, fontSize: 10),),
                  Text(
                  ConstString.BOTTOMTEXTONE,  style: TextStyle(
                    color: GREY, fontSize: 10),),
                    Text( completedTask,style: TextStyle(
                    color: GREY, fontSize: 10),),
                    Text(
                  ConstString.BOTTOMTEXTTWO,  style: TextStyle(
                    color: GREY, fontSize: 10),)

                    ]
            
              
              )]);
              
              


}

                