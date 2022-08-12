import 'package:flutter/material.dart';
import 'add_task.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/Widgets/task_list.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  late SharedPreferences pref;

Future displayShowCase() async{
  pref= await SharedPreferences.getInstance();
  bool? showCaseVisibilityStatus = pref.getBool('displayShowcase');
  if(showCaseVisibilityStatus==null){
    pref.setBool('displayShowcase', false);
    return true;
  }
  return false;
}

  @override
  void initState() {
    super.initState();
   displayShowCase().then((status){
     if(status){
       WidgetsBinding.instance.addPostFrameCallback((_)=>ShowCaseWidget.of(context).startShowCase([
         keyOne,
         keyTwo,
       ]),
       );
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton:  Showcase(
        title: 'Hello',titleTextStyle:const TextStyle(
        fontSize: 22.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
        description: 'Add your ToDo items',
        showcaseBackgroundColor: Colors.lightBlueAccent,
        blurValue: 2.0,
        overlayOpacity: 0,
        contentPadding: const EdgeInsets.all(8.0),
        descTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0
        ),
        key: keyOne,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(context: context, builder: (BuildContext context)=>AddTaskScreen());
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               const  CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
               const SizedBox(
                  height: 30.0,
                ),
               const Text(
                  'ToDo App',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' ${Provider.of<TaskData>(context).taskLength} tasks',
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
             child: Showcase(
               description: 'Press long on ToDo items to delete',
               showcaseBackgroundColor: Colors.white,
               blurValue: 2.0,
               overlayOpacity: 0.5,
               overlayColor: Colors.lightBlueAccent,
               contentPadding: const EdgeInsets.all(8.0),
               descTextStyle: const TextStyle(
                   color: Colors.lightBlueAccent,
                   fontWeight: FontWeight.bold,
                   fontSize: 18.0
               ),
               key: keyTwo,
                 child: TaskList(),
             ),
            ),
          ),
        ],
      ),
    );
  }
}





