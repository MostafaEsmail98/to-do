import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/task_model.dart';

class FirebaseFunctions {
 static CollectionReference<TaskModel> getTaskCollection(){
  return  FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromData(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toData();
      },);
  }
 static void addTask(TaskModel taskModel) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  taskModel.id = docRef.id;
  docRef.set(taskModel);

  }
}
