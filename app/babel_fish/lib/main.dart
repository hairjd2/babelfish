// ignore_for_file: prefer_const_constructors, unused_import

//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Babel Fish',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      home: const MyHomePage(title: 'Babel Fish'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  bool isListening = false;

  @override
  void toggleListener() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
      isListening = !isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic icon = isListening ? Icons.stop : Icons.mic;
    dynamic text = isListening ? 'Recording' : '';
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            FloatingActionButton.large(
              onPressed: toggleListener,
              child: Icon(
                icon,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // toggleListening() {
  //   setState(() {
  //     isListening = !isListening;
  //   });
  // }
}

// Widget _offsetPopup() => PopupMenuButton<int>(
//     itemBuilder: (context) => [
//           PopupMenuItem(
//             value: 1,
//             child: Text(
//               "Flutter Open",
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
//             ),
//           ),
//           PopupMenuItem(
//             value: 2,
//             child: Text(
//               "Flutter Tutorial",
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
//             ),
//           ),
//         ],
//     icon: Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: ShapeDecoration(
//           color: Colors.blue,
//           shape: StadiumBorder(
//             side: BorderSide(color: Colors.white, width: 2),
//           )),
//       //child: Icon(Icons.menu, color: Colors.white), <-- You can give your icon here
//     ));
