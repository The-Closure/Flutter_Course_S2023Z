import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_and_go/data/local_data/local_storage.dart';

import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/res/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/home_bloc.dart';

void main() async {
//  await initgetit();
// Bloc.observer = MyBlocObserver();
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();

    TextEditingController password = TextEditingController();
    return Builder(builder: (context) {
      return Scaffold(
          body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                myTextField(username),
                myTextField(password),
                ElevatedButton(
                    onPressed: () {
                      myMagic
                          .get<SharedPreferences>()
                          .setString('username', username.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(),
                          ));
                    },
                    child: Text("LogIn"))
              ]),
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.redAccent],
              )),
        ),
      ));
    });
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Hello Master ${myMagic.get<SharedPreferences>().getString('username')} ",
            style: TextStyle(fontSize: 32),
          ),
        ),
      );
    });
  }
}
