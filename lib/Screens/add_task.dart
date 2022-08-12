import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';


class AddTaskScreen extends StatelessWidget {


  String newTaskTitle='';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
             TextField(
               textInputAction: TextInputAction.none,
              autofocus: true,
              textAlign: TextAlign.center,
                onChanged: (newText){
                newTaskTitle=newText;
                },
              style: const TextStyle(fontSize: 24.0, color: Colors.black54),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 4.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
               Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
               Navigator.pop(context);
              },
              child: const Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
