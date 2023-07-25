import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../controller/local_storeage.dart';
import '../../../controller/service/app_constants.dart';
import '../../companents/custom/buttons/coniform_button.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../companents/style.dart';
import '../../medic_route.dart';


class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMedicalStyle.white,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              8.verticalSpace,
              const ResponsiveAppBar(
                title: "OTP Code Verification",
                paddingHorizontal: 0,
              ),
              86.verticalSpace,
              Text(
                "Code has been send to +${GMedicalStorage.getUser()?.phoneNumber?.countryCode} ${GMedicalStorage.getUser()?.phoneNumber?.getFormattedNsn()}",
                style: GMedicalStyle.urbanistMedium(size: 16),
              ),
              24.verticalSpace,
              Text(
                "Code: ${AppConstants.signInPassword}",
                style: GMedicalStyle.urbanistMedium(size: 18),
              ),
              60.verticalSpace,
              PinFieldAutoFill(
                controller: controller,
                codeLength: 4,
                cursor:
                    Cursor(color: GMedicalStyle.greyscale200, enabled: true, width: 2),
                decoration: BoxLooseDecoration(
                  textStyle: GMedicalStyle.urbanistSemiBold(),
                  gapSpace: 16.r,
                  radius: Radius.circular(16.r),
                  bgColorBuilder: const FixedColorBuilder(GMedicalStyle.greyscale50),
                  strokeColorBuilder:
                      const FixedColorBuilder(GMedicalStyle.greyscale200),
                ),
                onCodeSubmitted: (s) {
                  if (AppConstants.signInPassword == s) {
                    GMedicalRoute.goFillProfile(context);
                  }
                },
                onCodeChanged: (s) {
                  if (AppConstants.signInPassword == s) {
                    GMedicalRoute.goFillProfile(context);
                  }
                },
                currentCode: "",
              ),
              60.verticalSpace,
              RichText(
                text: TextSpan(
                  text: "Resend code in ",
                  style: GMedicalStyle.urbanistMedium(color: GMedicalStyle.greyscale900),
                  children: [
                    TextSpan(
                      text: "55",
                      style: GMedicalStyle.urbanistMedium(color: GMedicalStyle.primary),
                    ),
                    TextSpan(
                      text: " s",
                      style: GMedicalStyle.urbanistMedium(color: GMedicalStyle.greyscale900),
                    )
                  ],
                ),
              ),
              const Spacer(),
              ConfirmButton(
                onTap: () {},
                isLoading: false,
                title: 'Verify',
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
