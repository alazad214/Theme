import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theme/anotherpage.dart';
import 'package:theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData lighttheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light);
  ThemeData darktheme =
      ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);
  bool _iconBol = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconBol ? lighttheme : darktheme,
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            title: Text(
              "Theme",
              style: TextStyle(fontSize: 22),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _iconBol = !_iconBol;
                    });
                  },
                  icon: Icon(
                      _iconBol ? Icons.light_mode_rounded : Icons.dark_mode))
            ],
            elevation: 0,
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  //Get.off(AnotherPage());
                  Navigator.push(context, CupertinoPageRoute(builder: (_)=>AnotherPage()));
                },
                child: Text("ElevatedButton")),
          ),
        ));
  }
}
