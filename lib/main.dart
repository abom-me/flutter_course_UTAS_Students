import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deemo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter++;
          setState(() {});
        },

        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          spacing: 20.5,

          children: [
            Text("Hello"),
            Text("Hello2"),
            Text("Hello3"),
            Text("Hello4"),
            Text("Hello5"),
            Text("Hello6"),
            Text("Hello7"),
          ],
        ),
      ),
      appBar: AppBar(centerTitle: true, title: Text("Title")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 50, color: Color(0xff4e6be4)),
            ),
          ],
        ),
      ),
    );
  }
}
