
import 'package:app_to_do/screens/my_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/tasks_list.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
    static const id = "RecycleBinScreen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: const Text("Recycle bin"),
        ),

        drawer: const MyDrawer(),
        body:const  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Chip(label: Text("Tasks")),
          ),
          TasksList(tasks: [])
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: "Add tasks",
          child: const Icon(Icons.add),
        ),
    );
  }
}