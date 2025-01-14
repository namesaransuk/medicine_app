import 'package:flutter/material.dart';
import 'package:medicine_app/utils/MLCommon.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:medicine_app/components/MLSocialAccountComponent.dart';
import 'package:medicine_app/screens/MLDashboardScreen.dart';
import 'package:medicine_app/screens/MLForgetPasswordScreen.dart';
import 'package:medicine_app/screens/MLRegistrationScreen.dart';
import 'package:medicine_app/utils/MLColors.dart';
import 'package:medicine_app/utils/MLString.dart';
import 'package:medicine_app/main.dart';

class MLLoginScreen extends StatefulWidget {
  static String tag = '/MLLoginScreen';

  @override
  _MLLoginScreenState createState() => _MLLoginScreenState();
}

class _MLLoginScreenState extends State<MLLoginScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(mlPrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mlPrimaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32),
              backgroundColor: context.cardColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.height,
                  Text(mlLogin_title!, style: secondaryTextStyle(size: 16)),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    decoration: InputDecoration(
                      labelText: mlPhone_number!,
                      labelStyle: secondaryTextStyle(size: 16),
                      prefixIcon: Icon(Icons.email_outlined, color: appStore.isDarkModeOn ? white : black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mlColorLightGrey.withOpacity(0.2)),
                      ),
                    ),
                  ),
                  8.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(
                      labelText: mlPassword!,
                      labelStyle: secondaryTextStyle(size: 16),
                      prefixIcon: Icon(Icons.lock_outline, color: appStore.isDarkModeOn ? white : black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mlColorLightGrey.withOpacity(0.2)),
                      ),
                    ),
                  ),
                  8.height,
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(mlForget_password!, style: secondaryTextStyle(size: 16)).onTap(
                      () {
                        MLForgetPasswordScreen().launch(context);
                      },
                    ),
                  ),
                  24.height,
                  AppButton(
                    color: mlPrimaryColor,
                    width: double.infinity,
                    onTap: () {
                      finish(context);
                      MLDashboardScreen().launch(context);
                    },
                    child: Text(mlLogin!, style: boldTextStyle(color: white)),
                  ),
                  22.height,
                  Text(mlLogin_with!, style: secondaryTextStyle(size: 16)).center(),
                  22.height,
                  MLSocialAccountsComponent(),
                  22.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(mlDont_have_account!, style: primaryTextStyle()),
                      8.width,
                      Text(
                        mlRegister!,
                        style: boldTextStyle(color: mlColorBlue, decoration: TextDecoration.underline),
                      ).onTap(
                        () {
                          MLRegistrationScreen().launch(context);
                        },
                      ),
                    ],
                  ),
                  32.height,
                ],
              ).paddingOnly(left: 16, right: 16),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 75),
          //   width: context.width(),
          //   child: commonCachedNetworkImage(ml_ic_register_indicator!, alignment: Alignment.center, width: 200, height: 200),
          // ),
        ],
      ),
    );
  }
}
