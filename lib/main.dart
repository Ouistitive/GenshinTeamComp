
import 'package:flutter/material.dart';
import 'package:genshin_teamcomp/Vue/HomePage.dart';

void main() {
  runApp(GenshinTeamCompApp());
}

class GenshinTeamCompApp extends StatelessWidget {
  GenshinTeamCompApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Genshin TeamComp Helper',
      home: SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}