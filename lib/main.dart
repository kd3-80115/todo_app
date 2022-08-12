import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
import 'Screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: ShowCaseWidget(
          builder: Builder(builder: (_) => TasksScreen()),
        ),
      ),
    );
  }
}
