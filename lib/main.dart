import 'package:flutter/material.dart';

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

List<String> mylist = ["Hello", "World"];

double myWidth = 300;
double myheight = 400;
Color myColor = Colors.blue;

String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Initial Selected Value

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: [
                DropdownMenuItem(child: Text(items[0]), value: items[0]),
                DropdownMenuItem(child: Text(items[1]), value: items[1]),
                DropdownMenuItem(child: Text(items[2]), value: items[2]),
                DropdownMenuItem(child: Text(items[3]), value: items[3]),
                DropdownMenuItem(child: Text(items[4]), value: items[4]),
              ]
              // After selecting the desired option,it will
              // change button value to selected value
              ,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// listitem(String num, Color colorcont, colortxt) {
//   return Container(
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(40), color: colorcont),
//     width: 150,
//     height: 300,
//     child: Center(
//       child: Text(
//         num,
//         style: TextStyle(color: colortxt, fontSize: 50),
//       ),
//     ),
//   );
// }
                          
          //ListWheelScrollView(itemExtent: 250,physics: FixedExtentScrollPhysics(),perspective: 0.002, diameterRatio: 1.3,squeeze: 1.1,offAxisFraction: 0.1,