import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/screens/tasks/editTask.dart';
import 'package:to_do/sherad/firebase_function.dart';
import 'package:to_do/styles/text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      child: Slidable(
        startActionPane: ActionPane(
            motion: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DrawerMotion(),
            ),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                backgroundColor: Colors.red,
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(taskModel.id);
                },
                label: "Delete",
                icon: Icons.delete,
              ),
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                backgroundColor: Colors.blue,
                onPressed: (context) {

                  Navigator.pushNamed(context, EditTask.routeName,arguments: taskModel);
                },
                label: "Edit",
                icon: Icons.edit,
              ),
            ]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              Container(
                color: taskModel.isDone == true ? Colors.green : Colors.blue,
                height: 62.h,
                width: 4.w,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${taskModel.title}",
                        style: taskModel.isDone
                            ? Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.green)
                            : Theme.of(context).textTheme.bodyMedium),
                    Row(
                      children: [
                        Icon(Icons.alarm, size: 15),
                        SizedBox(width: 5.w),
                        Text("${taskModel.description}",
                            style: taskModel.isDone
                                ? Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                : Theme.of(context).textTheme.bodySmall),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  FirebaseFunctions.updataTask(taskModel.id, true);
                },
                child: Container(
                    height: 34.h,
                    width: 69.w,
                    decoration: BoxDecoration(
                      color:
                          taskModel.isDone == true ? Colors.green : Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: taskModel.isDone == true
                        ? Center(
                            child: Text(
                            "Done!",
                            style: TextStyle(color: Colors.white),
                          ))
                        : Icon(
                            Icons.done,
                            color: Colors.white,
                          )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
