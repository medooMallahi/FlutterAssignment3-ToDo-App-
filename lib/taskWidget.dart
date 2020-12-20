import 'package:flutter/material.dart';
import 'package:my_app/taskModel.dart';

import 'package:my_app/constatnts.dart';
import 'package:my_app/sp_helper.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  Task task;
  Function function;

  TaskWidget(this.task, [this.function]);
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
} // end of TaskWidget

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  SpHelper.spHelper.removeItem(widget.task);
                  setState(() {});
                  widget.function();
                }),
            Text(widget.task.taskName),
            Checkbox(
              value: widget.task.isCompleted,
              onChanged: (value) {
                this.widget.task.isCompleted = !this.widget.task.isCompleted;
                setState(() {});
                widget.function();
              },
            )
          ],
        ),
      ),
    );
  }
} // end of TaskWidget
