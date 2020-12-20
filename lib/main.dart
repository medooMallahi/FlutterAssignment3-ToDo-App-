import 'package:flutter/material.dart';
import 'package:my_app/constatnts.dart';
import 'package:my_app/newTask.dart';
import 'package:my_app/sp_helper.dart';
import 'package:my_app/taskWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    SpHelper.spHelper.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter To Do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "To Do List ",
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All tasks",
              ),
              Tab(
                text: "Completed tasks",
              ),
              Tab(
                text: "Incompleted tasks",
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: [AllTasks(), CompletedTasks(), InCompletedTasks()],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewTask();
            }))
          },
        ),
      ),
    ));
  }
}

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: tasks.map((task) => TaskWidget(task, myFun)).toList(),
        ),
      ),
    );
  }
}

class CompletedTasks extends StatefulWidget {
  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: tasks
            .where((element) => element.isCompleted == true)
            .map((e) => TaskWidget(e, myFun))
            .toList(),
      ),
    );
  }
} // end of CompletedTasks

class InCompletedTasks extends StatefulWidget {
  @override
  _InCompletedTasksState createState() => _InCompletedTasksState();
}

class _InCompletedTasksState extends State<InCompletedTasks> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: tasks
            .where((element) => element.isCompleted == false)
            .map((e) => TaskWidget(e, myFun))
            .toList(),
      ),
    );
  }
} // end of InCompletedTasks
