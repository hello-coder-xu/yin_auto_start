import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autostart/autostart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('auto start manage test'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => checkAutoStartManager(context),
            child: Text('to auto start manager'),
          ),
        ),
      ),
    );
  }

  void checkAutoStartManager(BuildContext context) async {
    bool isAutoStartPermissionAvailable = await Autostart.isAutoStartPermissionAvailable;
    if (isAutoStartPermissionAvailable) {
      print('test available ok');
      Autostart.getAutoStartPermission();
    } else {
      print('test available fail');
    }
  }
}
