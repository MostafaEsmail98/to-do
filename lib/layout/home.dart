import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/provider_bottonNavigation.dart';
import 'package:to_do/screens/tasks/tasks_tab.dart';
import 'package:to_do/sherad/BottonSheet/bottonOfFloatingAction.dart';
import '../screens/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [TasksTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderNavigation(),
        builder: (context, child) {
          var pro = Provider.of<ProviderNavigation>(context);
          return SafeArea(
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                  title: Text(
                    pro.index == 0
                        ? AppLocalizations.of(context)!.todolist
                        : AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  toolbarHeight: 120.h,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  elevation: 0),
              body: tabs[pro.index],
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white)),
                onPressed: () {
                  showNewTask();
                },
                child: Icon(Icons.add),
              ),
              bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 8,
                child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onTap: (value) {
                      pro.changePage(value);
                    },
                    currentIndex: pro.index,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.list), label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: "")
                    ]),
              ),
            ),
          );
        });
  }

  showNewTask() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ShowBottonFloating(),
          );
        },
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              width: 3, color: Theme.of(context).colorScheme.primary),
        ));
  }
}
