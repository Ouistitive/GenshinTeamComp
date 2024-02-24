
import 'package:flutter/material.dart';

import '../../MyColors.dart';
import '../../controller/AddTeamCompController.dart';

class AddTeamCompForm extends StatefulWidget {
  const AddTeamCompForm({super.key});

  @override
  _AddTeamCompFormState createState() => _AddTeamCompFormState();
}

class _AddTeamCompFormState extends State<AddTeamCompForm> {
  AddTeamCompController controller = AddTeamCompController();

  Widget build(BuildContext context) {
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
            const Text("My Team comp"),
            FutureBuilder<Widget>(
              future: controller.getCharacterCards(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return snapshot.data!;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}