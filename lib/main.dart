import 'package:arabic_font/arabic_font.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ut_st/create_account.dart';
import 'package:flutter_app_ut_st/firebase_options.dart';
import 'package:flutter_app_ut_st/keys.dart';
import 'package:flutter_app_ut_st/login.dart';
import 'package:flutter_app_ut_st/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deemo',
      theme: ThemeData(
        fontFamily: ArabicThemeData.font(
          /// Select The type of font
          arabicFont: ArabicFont.dinNextLTArabic,
        ),
        package: ArabicThemeData.package,
        appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: MyHomePage(),
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
  bool loggedIn = false;

  currentUser() async {
    final user = fireAuth.currentUser;
    if (user != null) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MyProfile()));
      });
    } else {
      setState(() {
        loggedIn = false;
      });
    }
  }

  logout() async {
    await fireAuth.signOut();
    setState(() {
      loggedIn = false;
    });
  }

  @override
  void initState() {
    currentUser();
    // TODO: implement initState
    super.initState();
  }

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
            loggedIn
                ? ListTile(
                  onTap: () {
                    logout();
                  },
                  leading: Icon(Icons.logout),
                  title: Text("تسجيل الخروج"),
                )
                : ListTile(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  leading: Icon(Icons.login),
                  title: Text("تسجيل الدخول"),
                ),
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (v) => CreateAccount()));
              },
              child: Text("انشاء حساب"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (v) => LoginScreen()));
              },
              child: Text("تسجيل الدخول"),
            ),
          ],
        ),
      ),
    );
  }
}
