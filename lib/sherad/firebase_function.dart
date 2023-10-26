import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromData(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toData();
      },
    );
  }

  static void addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTaskCollection()
        .where("data",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static void updataTask(String id, bool isDone) {
    getTaskCollection().doc(id).update({"isDone": isDone});
  }
  static void editTask(TaskModel taskModel) {
    getTaskCollection().doc(taskModel.id).update(taskModel.toData());
  }
}
