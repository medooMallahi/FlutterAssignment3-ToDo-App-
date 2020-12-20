import 'package:flutter/material.dart';
import 'package:my_app/constatnts.dart';
import 'package:my_app/sp_helper.dart';
import 'package:my_app/taskModel.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool isCompleted = false;
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                this.taskName = value;
              },
            ),
            Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  this.isCompleted = value;
                  setState(() {});
                }),
            RaisedButton(
                child: Text("New One"),
                onPressed: () {
                  tasks.add(Task(this.taskName, this.isCompleted));
                  SpHelper.spHelper.saveData();
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
} // end of NewTask
