import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_and_go/data/local_data/local_storage.dart';
import 'package:plan_and_go/data/message/message.dart';
import 'package:plan_and_go/data/user_model/user_model.dart';

import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/res/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/home_bloc.dart';
import 'bloc/send_and_recive_message_bloc.dart';

void main() async {
  await initgetit();
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
                            context.read<HomeBloc>().add(Login(User(
                                username: username.text,
                                password: password.text)));

                            // myMagic
                            //     .get<SharedPreferences>()
                            //     .setString('username', username.text);
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
                )),
          ));
        }),
      );
    });
  }
}

class SecondPage extends StatelessWidget {
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendAndReciveMessageBloc()
        ..add(SendMessage(MessageModel(message: 'Hello There'))),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<SendAndReciveMessageBloc,
                SendAndReciveMessageState>(
              builder: (context, state) {
                if (state is Good) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(itemCount:1,
                          itemBuilder: (context, index) => Container(
                            child: Text(state.message),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.greenAccent[50],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 800,
                                child: TextField(
                                  controller: message,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                )),
                            IconButton(
                                onPressed: () {
                                  context.read<SendAndReciveMessageBloc>().add(
                                      SendMessage(
                                          MessageModel(message: message.text)));
                                },
                                icon: Icon(Icons.send))
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is Load) {
                  return Column(
                    children: [
                      CircularProgressIndicator(),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 800,
                                child: TextField(
                                  controller: message,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                )),
                            IconButton(
                                onPressed: () {
                                  context.read<SendAndReciveMessageBloc>().add(
                                      SendMessage(
                                          MessageModel(message: message.text)));
                                },
                                icon: Icon(Icons.send))
                          ],
                        ),
                      )
                    ],
                  );
                } else
                  return Center(
                    child: Text("Error"),
                  );
              },
            ));
      }),
    );
  }
}
