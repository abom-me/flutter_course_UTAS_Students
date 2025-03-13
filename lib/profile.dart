import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/keys.dart';
import 'package:flutter_app_ut_st/set.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();

  saveData() async {
    await fireStore.collection("users").add({
      "name": name.text,
      "phone": phone.text,
      "age": age.text,
      "email": fireAuth.currentUser!.email,
    });
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Set()),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ملفي الشخصي")),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(labelText: "الاسم"),
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(labelText: "الهاتف"),
            ),
            TextFormField(
              controller: age,
              decoration: InputDecoration(labelText: "العمر"),
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("حفظ"),
            ),
          ],
        ),
      ),
    );
  }
}
