
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin TeamComp'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("Hello world!"),
          ],
        ),
      ),
    );
  }
}
