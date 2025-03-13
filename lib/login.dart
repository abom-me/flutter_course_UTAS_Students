// stul For Stateful Widget
// stel For Stateless Widget
import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/keys.dart';
import 'package:flutter_app_ut_st/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formName = GlobalKey<FormState>();
  bool isLoading = false;

  login() async {
    if (formName.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final user = await fireAuth.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Welcome ${user.user?.email}")));
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MyProfile()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your email or password is incorrect")),
        );
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          spacing: 20,
          children: [
            Text(
              "تسجيل الدخول",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Form(
              key: formName,
              child: Column(
                children: [
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "عفوا، البريد الالكتروني مهم";
                      }
                      if (!text.contains("@")) {
                        return "هذا البريد غير صالح";
                      }
                      return null;
                    },

                    controller: email,
                    decoration: InputDecoration(
                      labelText: "ادخل البريد الالكتروني ",
                      labelStyle: TextStyle(fontSize: 20),
                      icon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "عفوا، كلمة المرور مهمة";
                      }
                      if (text.length < 6) {
                        return "كلمة المرور يجب ان تكون اطول من 6 حروف";
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "ادخل كلمة المرور",
                      labelStyle: TextStyle(fontSize: 20),
                      icon: Icon(Icons.password),
                    ),
                  ),
                ],
              ),
            ),

            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text("تسجيل الدخول"),
                ),
          ],
        ),
      ),
    );
  }
}
