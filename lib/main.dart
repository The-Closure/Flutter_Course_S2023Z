import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/res/string.dart';

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
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
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
                        context.read<HomeBloc>().add(Login(username.text));
                     showDialog(context: context, builder: (context) => newpage(context),);
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
      }),
    );
  }
}

  dynamic newpage(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is Success) {
                return Text(
                  "Hello Master ",
                  style: TextStyle(fontSize: 32),
                );
              } else 
                return CircularProgressIndicator();
              
            },
          )),
        );
      }
    );
  
}
