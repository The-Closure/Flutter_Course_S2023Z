// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:plan_and_go/data/local_data/local_storage.dart';
import 'package:plan_and_go/data/message/message.dart';
import 'package:plan_and_go/data/user_model/user_model.dart';
import 'package:plan_and_go/view/component/textfield.dart';
import 'package:plan_and_go/view/res/string.dart';

import 'bloc/home_bloc.dart';
import 'bloc/send_and_recive_message_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Chat(),
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => SecondPage(),
                            //     ));
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

class Message {
  String text;
  bool sentByMe;
  String date;
  Message({
    required this.text,
    required this.sentByMe,
    required this.date,
  });
}

// good ?
// are you seen me ?

List<Message> elements = [
  Message(text: 'text', sentByMe: false, date: 'a'),
  Message(text: 'text1', sentByMe: false, date: 'b'),
  Message(text: 'text2', sentByMe: false, date: 'b'),
  Message(text: 'text3', sentByMe: true, date: 'b'),
  Message(text: 'text4', sentByMe: false, date: 'b'),
  Message(text: 'text5', sentByMe: true, date: 'b'),
];

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => SecondPage();
}

    TextEditingController value = TextEditingController();

class SecondPage extends State<Chat> {
   SecondPage({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
              child: GroupedListView(
                reverse: true,
                order: GroupedListOrder.DESC,
            elements: elements,
            groupBy: (elements) => 'b',
            padding: EdgeInsets.all(8),
            groupHeaderBuilder: (element) => SizedBox(),
            itemBuilder: (context, element) => Align(
              alignment: element.sentByMe ? Alignment.centerRight : Alignment.centerLeft,

              child: element.sentByMe ?Container(width: 200,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),)),child:Card(color: Colors.green ,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(element.text,style: TextStyle(fontSize: 20,color: Colors.black),),
                )
              ))  :Container(width: 200,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),),),child:  Card(color: Colors.white,child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(element.text,style: TextStyle(fontSize: 20,color: Colors.black),),
              )),),
            ),
          )),
          Row(
            children: [
              Container(width: 300,
                color: Colors.grey[300],
                child: TextField(
                  onSubmitted: (value){
 setState(() {
                 var mess = Message(text: value, sentByMe: true, date: 'a');
                      elements.add(mess);
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: "enter your message"),
                ),
              ),
              IconButton(onPressed: (){
                   
              }, icon: Icon(Icons.send))
            ],
          )
        ]),
      );
  }
}
