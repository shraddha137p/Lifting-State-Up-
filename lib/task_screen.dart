import 'package:flutter/material.dart';
import 'package:lifting_state_up_demo/add_task_screen.dart';
import 'package:lifting_state_up_demo/model.dart';
import 'package:lifting_state_up_demo/widget/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<TaskModel> tasks = [];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              context: context,
              builder: (BuildContext context) => AddTaskScreen((newTaskTitle) {
                setState(() {
                  
                tasks.add(TaskModel(name: newTaskTitle));
                });
              }),
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.menu),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Today Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '12 Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 350,
                width: double.infinity,
                color: Colors.white,
                child: TasksList(tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
