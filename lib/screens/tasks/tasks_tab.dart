import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/my_provider.dart';
import 'package:to_do/screens/tasks/task_item.dart';

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
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
          ),
        )
      ],
    );
  }
}
