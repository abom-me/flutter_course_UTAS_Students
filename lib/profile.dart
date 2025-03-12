import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = "";
  String password = "";

  getMyProfile() async {
    final SharedPreferences data = await SharedPreferences.getInstance();
    name = data.getString("name") ?? "UnKnown";
    password = data.getString("password") ?? "UnKnown";

    setState(() {});
  }

  ///  لكي يعمل الفانكشن قبل لا يتم بناء شاشة التطبيق
  @override
  void initState() {
    getMyProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // الانتقال لصفحة التالية مع ابقاء الصفحة السابقة مفتوحة
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (v) => LoginScreen()));

              // الانتقال لصفحة التالية مع اغلاق الصفحة السابقة
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (r) => LoginScreen()),
              // );

              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (_) => LoginScreen()),
              //   (_) => false,
              // );
            },
            icon: Icon(Icons.login),
          ),
        ],
        title: Text("ملفي الشخصي"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              "الاسم: $name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "كلمة المرور: $password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
