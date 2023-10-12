import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/my_provider.dart';
import '../../styles/text.dart';

class ShowBottonSetting extends StatelessWidget {

  String var1;
  String var2;
  int index;


  ShowBottonSetting(this.var1, this.var2,this.index);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              InkWell(
                onTap: () {
                  if (index==0){
                  pro.changeLang("en");
                  }
                  else{
                    pro.changeTheme(ThemeMode.light);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      var1,
                      style:index==0?pro.Language=="en"?Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25):Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25,color: Colors.black):pro.mode==ThemeMode.light?Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25):Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25,color: Colors.black),
                    ),
                    Spacer(),
                    index ==0?pro.Language=="en"?
                    Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.primary,
                    ):SizedBox.shrink():pro.mode==ThemeMode.light?Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.primary,
                    ):SizedBox.shrink()
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  if (index==0){
                  pro.changeLang("ar");
                  }
                  else{
                    pro.changeTheme(ThemeMode.dark);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      var2,
                      style: index==0?pro.Language=="ar"?Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25):Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25,color: Colors.black):pro.mode==ThemeMode.dark?Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25):Theme.of(context).textTheme.bodyMedium!
                          .copyWith(fontSize: 25,color: Colors.black),
                    ),
                    Spacer(),
                    index ==0?pro.Language=="ar"?
                    Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.primary,
                    ):SizedBox.shrink():pro.mode==ThemeMode.dark?Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.primary,
                    ):SizedBox.shrink()
                  ],
                ),
              ),
            ]),
          ),
        );

  }
}
