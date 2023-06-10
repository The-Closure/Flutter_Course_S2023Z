import 'package:flutter/material.dart';
import 'package:plan_and_go/view/component/on_boarding_text.dart';
import 'package:plan_and_go/view/component/one_grid.dart';
import 'package:plan_and_go/view/component/speical_button.dart';
import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/component/top_text.dart';
import 'package:plan_and_go/view/pages/homepage/home_page.dart';
import 'package:plan_and_go/view/res/image.dart';
import 'package:plan_and_go/view/res/string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstString.APPLICATIONAME,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneGrid(),
    );
  }
}