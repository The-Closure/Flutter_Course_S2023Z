import 'package:flutter/material.dart';
import 'package:session_statefull/view/pages/second_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> mylist = ["Hello","World"];

double myWidth = 300;
double myheight = 400;
Color myColor = Colors.blue;
List<bool> myLogic = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("This is an appbar"),actions: [TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
      }, child: Text("Navigate"))],),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => Dismissible(
          movementDuration: Duration(seconds: 4),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction){
              if(direction == DismissDirection.endToStart){
                print("delete");
              }
              else {
                print("hello");
              }
          },
          background:Container(child: Icon(Icons.delete),color: Colors.red,),
          key: GlobalKey(),
          child: CheckboxListTile(
            secondary: Hero(
              tag:'$index',
              child: CircleAvatar(
                child: Image.asset('assets/photo.jpg'),
              ),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            subtitle: Text(mylist[index%2]),
            title: Text("List Tile"),
            value: myLogic[index],
            onChanged: (variable) {
              setState(() {
                myLogic[index] = variable!;
              });
            },
          ),
        ),
      ),
    );
  }

  // Center Example_for_Animated_Container() {
  //   return Center(
  //     child:
  //         Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
  //       ElevatedButton(
  //           child: Text("Sized Up Container"),
  //           onPressed: () {
  //             setState(() {
  //               myWidth = 800;
  //               myColor = Colors.black;
  //             });
  //             print('object');
  //           }),
  //       OutlinedButton(
  //           child: Text("pressed me"),
  //           onPressed: () {
  //             setState(() {
  //               myWidth = 400;
  //               myColor = Colors.red;
  //             });
  //           }),
  //       TextButton(
  //           child: Text("pressed me"),
  //           onPressed: () {
  //             setState(() {
  //               myLogic = !myLogic;
  //             });
  //           }),
  //       AnimatedContainer(
  //         child: Text(
  //           "Hello World",
  //           style: TextStyle(color: Colors.white, fontSize: 40),
  //         ),
  //         width: myWidth,
  //         height: myheight,
  //         color: myColor,
  //         duration: Duration(milliseconds: 400),
  //       ),
  //       Checkbox(
  //           value: myLogic,
  //           onChanged: (variable) {
  //             setState(() {
  //               myLogic = variable!;
  //             });
  //           })
  //     ]),
  //   );
  // }
}
