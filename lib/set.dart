import 'package:flutter/material.dart';

class Set extends StatefulWidget {
  const Set({super.key});

  @override
  State<Set> createState() => _SetState();
}

class _SetState extends State<Set> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          Text("الاعدادات"),
          ElevatedButton(
            onPressed: () {
       
            },
            child: Text("تسجيل الخروج"),
          ),
        ],
      ),
    );
  }
}
