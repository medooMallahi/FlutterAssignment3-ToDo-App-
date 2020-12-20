import 'dart:convert';
import 'package:my_app/constatnts.dart';
import 'package:my_app/taskModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveData() {
    List<String> stringList =
        tasks.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', stringList);
  }

  void addItem(Task item) {
    tasks.insert(0, item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');

    if (listString != null) {
      tasks =
          listString.map((item) => Task.fromMap(json.decode(item))).toList();
    }
  }

  void removeItem(Task item) {
    tasks.remove(item);
    saveData();
  }
}
