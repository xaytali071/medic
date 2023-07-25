// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../controller/auth/auth_provider.dart';
import '../../../controller/local_storeage.dart';
import '../../../controller/service/validators.dart';
import '../../../model/models/user_data.dart';
import '../../companents/app_assets.dart';
import '../../companents/custom/buttons/button_effect.dart';
import '../../companents/custom/buttons/coniform_button.dart';
import '../../companents/custom/custom_loading.dart';
import '../../companents/custom/custom_text_form_field.dart';
import '../../companents/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: GMedicalStyle.white,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(
                Assets.gMedicalSingIn,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        32.verticalSpace,
                        Text(
                          "Sing In To",
                          style: GMedicalStyle.urbanistSemiBold(
                              color: GMedicalStyle.white, size: 32),
                        ),
                        8.verticalSpace,
                        Text(
                          "Your Account",
                          style: GMedicalStyle.urbanistSemiBold(
                              color: GMedicalStyle.white, size: 32),
                        ),
                        30.verticalSpace,
                        Text(
                          "Please sing to enter in a app",
                          style: GMedicalStyle.urbanistSemiBold(
                              color: GMedicalStyle.white, size: 16),
                        ),
                        34.verticalSpace,
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                controller: emailController,
                                hintText: "Phone",
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                prefixIcon: Padding(
                                  padding: REdgeInsets.only(left: 12, right: 8),
                                  child: SvgPicture.asset(
                                    Assets.svgEmailFill,
                                    height: 24.r,
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                              Consumer(builder: (context, ref, child) {
                                final state = ref.watch(authProvider);
                                final event = ref.read(authProvider.notifier);
                                return CustomTextField(
                                  obscureText: state.showPassword,
                                  suffixIcon: IconButton(
                                      onPressed: event.setVisible,
                                      icon: Icon(
                                        state.showPassword
                                            ? FlutterRemix.eye_line
                                            : FlutterRemix.eye_close_line,
                                        size: 20.r,
                                      )),
                                  controller: passwordController,
                                  hintText: "Password",
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  prefixIcon: Padding(
                                    padding: REdgeInsets.only(left: 12, right: 8),
                                    child: SvgPicture.asset(
                                      Assets.svgLock,
                                      color: GMedicalStyle.greyscale500,
                                      height: 28.r,
                                    ),
                                  ),
                                  validator: AppValidators.isNotEmptyValidator,
                                );
                              }),
                              20.verticalSpace,
                              AnimatedOpacity(
                                opacity: _isVisible ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 600),
                                child: Consumer(builder: (context, ref, child) {
                                  final state = ref.watch(authProvider);
                                  final event = ref.read(authProvider.notifier);
                                  return CustomTextField(
                                    obscureText: state.showPassword,
                                    suffixIcon: IconButton(
                                        onPressed: event.setVisible,
                                        icon: Icon(
                                          state.showPassword
                                              ? FlutterRemix.eye_line
                                              : FlutterRemix.eye_close_line,
                                          size: 20.r,
                                        )),
                                    controller: confirmPasswordController,
                                    hintText: "Confirm password",
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    prefixIcon: Padding(
                                      padding: REdgeInsets.only(left: 12, right: 8),
                                      child: SvgPicture.asset(
                                        Assets.svgLock,
                                        color: GMedicalStyle.greyscale500,
                                        height: 28.r,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              24.verticalSpace,
                            ],
                          ),
                        ),

                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(authProvider);
                          final notifier = ref.read(authProvider.notifier);
                          return ConfirmButton(
                            onTap: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                await GMedicalStorage.setUser(UserData(
                                  email: emailController.text,
                                ));
                                // ignore: use_build_context_synchronously
                                notifier.signUp(context);
                              }
                            },
                            isLoading: state.isLoading,
                            title: _isVisible ? "Sign up" : "Sing in",
                          );
                        }),
                        24.verticalSpace,
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: GMedicalStyle.white,
                              thickness: 2,
                            )),
                            Padding(
                              padding: REdgeInsets.symmetric(horizontal: 16),
                              child: const Text(
                                "OR",
                                style: TextStyle(color: GMedicalStyle.white),
                              ),
                            ),
                            const Expanded(
                                child: Divider(
                              color: GMedicalStyle.white,
                              thickness: 2,
                            )),
                          ],
                        ),
                        30.verticalSpace,
                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(authProvider);
                          final notifier = ref.read(authProvider.notifier);
                          return ButtonsEffect(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100.r),
                              onTap: () => notifier.loginGoogle(context),
                              child: Container(
                                height: 60.r,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: GMedicalStyle.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                    child: CustomLoading(
                                  isLoading: state.isGoogleLoading,
                                  color: GMedicalStyle.white,
                                  size: 26,
                                  child: Text(
                                      "Sing ${_isVisible ? "up" : "in"} with Google",
                                      style: GMedicalStyle.urbanistSemiBold(
                                          size: 16, color: GMedicalStyle.white)),
                                )),
                              ),
                            ),
                          );
                        }),
                        16.verticalSpace,
                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(authProvider);
                          final notifier = ref.read(authProvider.notifier);
                          return ButtonsEffect(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100.r),
                              onTap: () => notifier.loginFacebook(context),
                              child: Container(
                                height: 60.r,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: GMedicalStyle.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                    child: CustomLoading(
                                  isLoading: state.isFacebookLoading,
                                  color: GMedicalStyle.white,
                                  size: 26,
                                  child: Text(
                                      "Sing ${_isVisible ? "up" : "in"} with Facebook",
                                      style: GMedicalStyle.urbanistSemiBold(
                                          size: 16, color: GMedicalStyle.white)),
                                )),
                              ),
                            ),
                          );
                        }),
                        30.verticalSpace,
                        Center(
                          child: TextButton(
                            style: GMedicalStyle.buttonStyle,
                            onPressed: () => _toggleVisibility(),
                            child: RichText(
                              text: TextSpan(
                                  text: _isVisible
                                      ? "Already have an account? "
                                      : "You don't have any account?",
                                  style: GMedicalStyle.urbanistMedium(
                                      size: 14, color: GMedicalStyle.white),
                                  children: [
                                    TextSpan(
                                      text:
                                          _isVisible ? "  Sign in" : "  Sing up",
                                      style: GMedicalStyle.urbanistSemiBold(
                                          size: 14, color: GMedicalStyle.white),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        12.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (1 == 2)
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: GMedicalStyle.primary.withOpacity(0.7),
              )
          ],
        ));
  }
}
