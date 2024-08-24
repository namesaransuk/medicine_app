import 'package:flutter/material.dart';
import 'package:medicine_app/components/MLBottomNavigationBarWidget.dart';
import 'package:medicine_app/fragments/MLCalendarFragment.dart';
import 'package:medicine_app/fragments/MLChatFragment.dart';
import 'package:medicine_app/fragments/MLHomeFragment.dart';
import 'package:medicine_app/fragments/MLNotificationFragment.dart';
import 'package:medicine_app/fragments/MLProfileFragemnt.dart';
import 'package:medicine_app/utils/MLColors.dart';
import 'package:medicine_app/utils/MLCommon.dart';

class MLDashboardScreen extends StatefulWidget {
  static String tag = '/MLDashboardScreen';

  @override
  _MLDashboardScreenState createState() => _MLDashboardScreenState();
}

class _MLDashboardScreenState extends State<MLDashboardScreen> {
  int currentWidget = 0;
  List<Widget> widgets = [
    MLHomeFragment(),
    MLChatFragment(),
    MLCalendarFragment(),
    MLNotificationFragment(),
    MLProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    changeStatusColor(mlPrimaryColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgets[currentWidget],
        bottomNavigationBar: Container(color: Colors.white, child: showBottomDrawer()),
      ),
    );
  }

  Widget showBottomDrawer() {
    return MLBottomNavigationBarWidget(
      index: currentWidget,
      onTap: (index) {
        setState(() {});
        currentWidget = index;
      },
    );
  }
}
