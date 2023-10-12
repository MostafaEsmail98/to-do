
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/provider/my_provider.dart';
import 'package:to_do/sherad/firebase_function.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowBottonFloating extends StatefulWidget {
  @override
  State<ShowBottonFloating> createState() => _ShowBottonFloatingState();
}

class _ShowBottonFloatingState extends State<ShowBottonFloating> {
  var selectedData = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.addNewTask,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black)),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            style: pro.mode == ThemeMode.light
                ? TextStyle(color: Colors.black)
                : TextStyle(color: Colors.white),
            controller: titleController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.titleTask,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            style: pro.mode == ThemeMode.light
                ? TextStyle(color: Colors.black)
                : TextStyle(color: Colors.white),
            controller: desController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.enterYourTask,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary)),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: () {
              showCalender(context);
            },
            child: Text(
              AppLocalizations.of(context)!.selectTime,
              style: pro.mode == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color: Colors.black)
                  : Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(selectedData.toString().substring(0, 10),
              style: pro.mode == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
              textAlign: TextAlign.center),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () {
              TaskModel taskModel = TaskModel(
                  title: titleController.text,
                  data: selectedData.millisecond,
                  description: desController.text);
              FirebaseFunctions.addTask(taskModel);
            },
            child: Text(AppLocalizations.of(context)!.addTask),
          )
        ],
      ),
    );
  }

  showCalender(BuildContext context) async {
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
    selectedData = chosenData;
    setState(() {});
  }
}
