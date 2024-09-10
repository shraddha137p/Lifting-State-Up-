import 'package:flutter/material.dart';
import 'package:lifting_state_up_demo/model.dart';
import 'package:lifting_state_up_demo/widget/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<TaskModel> tasks;
  const TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:widget.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          onTap: () {
           setState(() {
              widget.tasks.removeAt(index);
           });
          },
          checkboxCallback: (checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },);
        });
  }
}
