// stul For Stateful Widget
// stel For Stateless Widget
import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  save() async {
    final SharedPreferences data = await SharedPreferences.getInstance();

    await data.setString("name", name.text);
    await data.setString("password", password.text);
    print("your data is saved");
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل دخول')),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          spacing: 20,
          children: [
            Image.asset("images/login.png", width: 300, height: 300),
            Text(
              "آهلا بك في التطبيق الخاص بك",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "ادخل اسمك",
                labelStyle: TextStyle(fontSize: 20),
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "ادخل كلمة المرور",
                labelStyle: TextStyle(fontSize: 20),
                icon: Icon(Icons.password),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              child: Text("حفظ البيانات"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => Set()),
                  (_) => false,
                );
              },
              child: Text("التالي"),
            ),
          ],
        ),
      ),
    );
  }
}
