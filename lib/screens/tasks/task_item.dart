import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/styles/text.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Container(
              color: Colors.blue,
              height: 62.h,
              width: 4.w,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Play Basket",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Row(
                    children: [
                      Icon(Icons.alarm, size: 15),
                      SizedBox(width: 5.w),
                      Text("data"),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
                height: 34.h,
                width: 69.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  alignment: Alignment.topCenter,
                  onPressed: () {},
                  icon: Icon(Icons.done, color: Colors.white, size: 20),
                ))
          ]),
        ),
      ),
    );
  }
}
