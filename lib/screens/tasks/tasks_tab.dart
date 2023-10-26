import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/my_provider.dart';
import 'package:to_do/screens/tasks/task_item.dart';
import 'package:to_do/sherad/firebase_function.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
                width: 413.w,
                height: 40.h,
                color: Theme.of(context).colorScheme.primary),
            CalendarTimeline(
              initialDate: pro.selectDay,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                pro.changeData(date);
              },
              leftMargin: 20,
              monthColor:
                  pro.mode == ThemeMode.light ? Colors.black : Colors.white,
              dayColor:
                  pro.mode == ThemeMode.light ? Colors.black : Colors.white,
              activeDayColor: Theme.of(context).colorScheme.primary,
              activeBackgroundDayColor:
                  pro.mode == ThemeMode.light ? Colors.white : Colors.black,
              locale: pro.Language,
            ),
          ],
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getTasks(pro.selectDay),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error"));
            }
            List tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    taskModel: tasks[index],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
