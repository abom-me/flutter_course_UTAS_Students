import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/keys.dart';
import 'package:flutter_app_ut_st/login.dart';

class Set extends StatefulWidget {
  const Set({super.key});

  @override
  State<Set> createState() => _SetState();
}

class _SetState extends State<Set> {
  Map<String, dynamic> user = {};
  getUserData() async {
    final userData =
        await fireStore
            .collection("users")
            .where("email", isEqualTo: fireAuth.currentUser!.email)
            .get();

    if (userData.docs.isEmpty) {
      print("لا يوجد بيانات");
    } else {
      user = userData.docs[0].data();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [ 
          Text(user["name"]),
          Text(user["phone"]),
          Text(user["age"]),
          ElevatedButton(
            onPressed: () {
              fireAuth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            child: Text("تسجيل الخروج"),
          ),
        ],
      ),
    );
  }
}
