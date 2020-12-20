class Task {
  String taskName;
  bool isCompleted;
  Task(this.taskName, this.isCompleted);

  Task.fromMap(Map map)
      : this.taskName = map['taskName'],
        this.isCompleted = map['isCompleted'];

  Map toMap() {
    return {"taskName": this.taskName, "isCompleted": this.isCompleted};
  }
}
