import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked ;
  final String taskTitle;
  final Function checkBoxCallback;
  final VoidCallback onLongPressCallback;

  TaskTile({this.isChecked=false,this.taskTitle='',required this.checkBoxCallback,required this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing:Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
         onChanged: (newValue){
          checkBoxCallback(newValue);
        }
      ),
    );
  }
}


