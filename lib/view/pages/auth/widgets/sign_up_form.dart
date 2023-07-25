import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../../controller/service/app_helper.dart';
import '../../../../controller/service/validators.dart';
import '../../../companents/app_assets.dart';
import '../../../companents/custom/custom_text_form_field.dart';



class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.formKey,
    required this.phoneKey,
    required this.phoneController,
    required this.emailController,
    required this.nameController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final GlobalKey<FormFieldState<PhoneNumber>> phoneKey;
  final PhoneController phoneController;
  final TextEditingController emailController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PhoneFormField(
            key: phoneKey,
            defaultCountry: IsoCode.US,
            controller: phoneController,
            validator: PhoneValidator.compose([
              PhoneValidator.required(errorText: "Phone number empty"),
              PhoneValidator.validMobile(errorText: 'Phone number incorrect'),
            ]),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: AppHelper.inputDecoration(),
          ),
          16.verticalSpace,
          CustomTextField(
            controller: emailController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: Padding(
              padding: REdgeInsets.only(left: 12, right: 8),
              child: SvgPicture.asset(Assets.svgEmailFill, height: 24.r,),
            ),
            validator: AppValidators.isValidEmail,

          ),
          16.verticalSpace,
          CustomTextField(
            controller: nameController,
            textInputType: TextInputType.text,
            hintText: "Full Name",
            prefixIcon: Padding(
              padding: REdgeInsets.only(left: 12, right: 8),
              child: Icon(Icons.person, size: 24.r,),
            ),
            validator: AppValidators.isNotEmptyValidator,
          ),
        ],
      ),
    );
  }
}
