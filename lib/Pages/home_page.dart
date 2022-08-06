import 'package:custom_bottomappbar/Pages/chat_page.dart';
import 'package:custom_bottomappbar/Pages/dashboard_page.dart';
import 'package:custom_bottomappbar/Pages/profile_page.dart';
import 'package:custom_bottomappbar/Pages/setting_page.dart';
import 'package:custom_bottomappbar/widgets/floating_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentTab = 0;

  Widget currentScreen = const DashboardPage();

  @override
  Widget build(BuildContext context) {
    Widget mainBody() {
      switch (currentTab) {
        case 0:
          return const DashboardPage();
        case 1:
          return const ChatPage();
        case 2:
          return const ProfilePage();
        case 3:
          return const SettingPage();
        default:
          return const DashboardPage();
      }
    }

    return Scaffold(
      body: mainBody(),
      floatingActionButton: FloatingWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const DashboardPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_home.png',
                          color:
                              currentTab == 0 ? Color(0xff7F0DFF) : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ChatPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_budget.png',
                          color:
                              currentTab == 1 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          "Budget",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfilePage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_transaction.png',
                          color:
                              currentTab == 2 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          "Transaction",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color(0xff7F3DFF)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const SettingPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_profile.png',
                          color:
                              currentTab == 3 ? Color(0xff7F3DFF) : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0xff7F3DFF)
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
