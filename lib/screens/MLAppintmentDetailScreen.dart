import 'package:flutter/material.dart';
import 'package:medicine_app/main.dart';
import 'package:medicine_app/screens/PurchaseMoreScreen.dart';
import 'package:medicine_app/utils/MLColors.dart';
import 'package:medicine_app/utils/MLCommon.dart';
import 'package:nb_utils/nb_utils.dart';

class MLAppointmentDetailScreen extends StatefulWidget {
  static String tag = '/MLAppointmentDetailScreen';

  @override
  MLAppointmentDetailScreenState createState() => MLAppointmentDetailScreenState();
}

class MLAppointmentDetailScreenState extends State<MLAppointmentDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: Container(
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radiusOnly(topRight: 32),
            backgroundColor: appStore.isDarkModeOn ? black : white,
          ),
          child: Column(
            children: [
              8.height,
              Row(
                children: [
                  mlBackToPreviousWidget(context, appStore.isDarkModeOn ? white : blackColor),
                  Text('Appointment Details', style: boldTextStyle(size: 22)),
                ],
              ).paddingAll(16),
              Flexible(child: PurchaseMoreScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
