import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view/companents/app_assets.dart';
import '../../view/companents/style.dart';
import 'card_utils.dart';

abstract class AppHelper {
  AppHelper._();
  static InputDecoration inputDecoration(){
    return  InputDecoration(
      contentPadding:
      REdgeInsets.symmetric(vertical: 20, horizontal: 12),
      prefixIconConstraints:  BoxConstraints(maxHeight: 20.r),
      filled: true,
      hintText: "",
      fillColor: GMedicalStyle.greyscale50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: GMedicalStyle.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: GMedicalStyle.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: GMedicalStyle.transparent),
      ),
    );
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    double radius = 16,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor: GMedicalStyle.transparent,
      context: context,
      builder: (context) =>
          Padding(padding: MediaQuery.of(context).viewInsets, child: modal),
    );
  }


  static getCardTypeImage(CardType cardType){
    return cardType == CardType.Visa
        ? Assets.cardVisa
        : cardType == CardType.Master
        ? Assets.cardMastercard
        : cardType == CardType.Humo
        ? Assets.cardHumo
        : cardType == CardType.Uzcard
        ? Assets.cardUzcard
        : cardType == CardType.Jcb
        ? Assets.cardJcb
        : Assets.cardInvalid;
  }

}
