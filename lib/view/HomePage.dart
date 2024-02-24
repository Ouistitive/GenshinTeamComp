
import 'package:flutter/material.dart';
import 'package:genshin_teamcomp/Controller/HomeController.dart';

import 'package:genshin_teamcomp/MyColors.dart';
import 'package:genshin_teamcomp/view/form/AddTeamCompForm.dart';

class HomePage extends StatelessWidget {
  HomeController controller = HomeController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin TeamComp'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: MyColors.title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("My Team comp"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTeamCompForm()));
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
