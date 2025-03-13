import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  final formName = GlobalKey<FormState>();
  createAccount() async {
    if (formName.currentState!.validate()) {
      /// fun 1
      setState(() {
        isLoading = true;
      });

      /// fun 2
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      /// fun 3
      setState(() {
        isLoading = false;
      });
    } else {
      return;
    }

    /// fun 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('انشاء حساب ')),

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
                    createAccount();
                  },
                  child: Text("انشاء حساب"),
                ),
          ],
        ),
      ),
    );
  }
}
