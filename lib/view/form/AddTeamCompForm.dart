
import 'package:flutter/material.dart';

import '../../MyColors.dart';
import '../../controller/AddTeamCompController.dart';
import '../componant/CharacterCard.dart';

class AddTeamCompForm extends StatefulWidget {
  const AddTeamCompForm({super.key});

  @override
  _AddTeamCompFormState createState() => _AddTeamCompFormState();
}

class _AddTeamCompFormState extends State<AddTeamCompForm> {
  AddTeamCompController controller = AddTeamCompController();
  bool firstTime = true;
  String search = "";

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await controller.initializeData();
    setState(() {});
  }

  Future getData() async {
    await controller.searchCharacter(search);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget builder;
    if(firstTime) {
      firstTime = false;

      builder = FutureBuilder(
        future: controller.searchCharacter(search),
        builder: (BuildContext context, AsyncSnapshot<List<CharacterCard>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: (snapshot.data!.length / 3).ceil(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: snapshot.data!
                      .skip(index * 3)
                      .take(3)
                      .map((characterCard) => Expanded(
                    child: characterCard,
                  ))
                      .toList(),
                );
              },
            );
          }
        },
      );
    } else {
      builder = ListView.builder(
        itemCount: (controller.characterCards.length / 3).ceil(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.characterCards
                .skip(index * 3)
                .take(3)
                .map((characterCard) => Expanded(
              child: characterCard,
            )).toList(),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AddTeamCompController.title),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: MyColors.title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for a character',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  search = value;
                  getData();
                },
              ),
            ),
            Expanded(
              child: builder,
            ),
          ],
        ),
      ),
    );
  }
}