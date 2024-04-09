// ignore_for_file: library_private_types_in_public_api

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floaty_navy_bar/floaty_navy_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floaty Navy Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int currentIndex = 0;

  var pageList = <Widget>[
    const Scaffold(
      body: Center(child: Text("Home Page")),
      backgroundColor: Colors.amberAccent,
    ),
    const Center(
      child: Text("Search Page"),
    ),
    const Center(
      child: Text("Settings Page"),
    ),
    const Center(
      child: Text("Profile Page"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[140],
      body: Stack(
        children: [
          pageList[currentIndex],
          FloatyNavyBar(
            backgroundColor: Colors.black87,
            barHeight: 70.0,
            iconColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            iconSize: 28.0,
            indicatorColor: Colors.white,
            indicatorHeight: 3,
            indicatorWidth: 14.0,
            items: [
              NavyBarItem(
                icon: EvaIcons.homeOutline,
              ),
              NavyBarItem(
                icon: EvaIcons.search,
                title: "Search",
              ),
              NavyBarItem(
                icon: EvaIcons.settingsOutline,
              ),
              NavyBarItem(
                icon: EvaIcons.personOutline,
                title: "Profile",
              ),
            ],
            onChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
