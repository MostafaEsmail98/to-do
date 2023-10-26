import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/sherad/firebase_function.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "editTask";


  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var selectedData = DateTime.now();


  @override
  Widget build(BuildContext context) {

    var task = ModalRoute.of(context)?.settings.arguments as TaskModel;
    TextEditingController textTitle = TextEditingController(text: task.title);
    TextEditingController textDescription =
        TextEditingController(text: task.description);
    var dt = DateTime.fromMillisecondsSinceEpoch(task.data);


    return Scaffold(
      appBar: AppBar(
          title: Text(
            "To Do List",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          toolbarHeight: 120.h,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Edit Task", textAlign: TextAlign.center),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: textTitle,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          label: Text("Title Task")),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: textDescription,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          label: Text("Description Task")),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text("Select Time"),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () {
                        showCalender(context,dt);
                      },
                      child: Text("${selectedData.toString().substring(0, 10)}",
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          TaskModel tasks = TaskModel(
                              id: task.id,
                              title: textTitle.text,
                              data:
                                  DateUtils.dateOnly(selectedData).millisecondsSinceEpoch,
                              description: textDescription.text);
                          FirebaseFunctions.editTask(tasks);
                        },
                        child: Text("Save Changes"))
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  showCalender(BuildContext context, DateTime dt) async {

    DateTime? chosenData = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      primary: Colors.blue,
                      onPrimary: Colors.black,
                      onSurface: Colors.black)),
              child: child!);
        },
        initialDate: selectedData,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenData == null) {
      return;
    }
    dt = chosenData;
    selectedData = dt;
    setState(() {});
  }
}
