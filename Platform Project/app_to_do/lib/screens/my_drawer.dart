import 'package:app_to_do/screens/recycle_bin.dart';
import 'package:app_to_do/screens/task_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.amber,
          child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text(
                "Task drawer",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(TaskScreen.id),
                child: const ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text("My task"),
                  trailing: Text("0"),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBinScreen.id),
                child: const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                  trailing: Text("0"),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
