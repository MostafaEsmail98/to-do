import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/sherad/BottonSheet/bottonOfSetting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompSetting extends StatefulWidget {
  String title;
  String contant;
  int index;

  CompSetting(this.title, this.contant, this.index);

  @override
  State<CompSetting> createState() => _CompSettingState();
}

class _CompSettingState extends State<CompSetting> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.title,
            style:Theme.of(context).textTheme.bodySmall),
        SizedBox(
          height: 23.h,
        ),
        InkWell(
          onTap: () {
            if (widget.index == 0) {
              showSheet("English", "عربي",widget.index);
            } else {
              showSheet(AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark,widget.index);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 2.w)),
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            alignment: Alignment.centerLeft,
            width: 319.w,
            height: 48.h,
            child: Row(
              children: [
                Text(widget.contant,
                    style: Theme.of(context).textTheme.bodyMedium),
                Spacer(),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
          ),
        ),
      ],
    );
  }

  showSheet(String var1, String var2, int index) {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          )),
      builder: (context) {
        return ShowBottonSetting(var1, var2,index);
      },
    );
  }
}
