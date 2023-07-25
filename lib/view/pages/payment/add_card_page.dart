import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../controller/card/card_provider.dart';
import '../../../controller/payment/payment_provider.dart';
import '../../../controller/service/card_utils.dart';
import '../../companents/app_assets.dart';
import '../../companents/custom/buttons/coniform_button.dart';
import '../../companents/custom/custom_text_form_field.dart';
import '../../companents/custom/keyboart_dissimer.dart';
import '../../companents/custom/responsive_app_bar.dart';
import '../../companents/style.dart';
import 'widgets/custom_card.dart';


class AddCardPage extends ConsumerStatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends ConsumerState<AddCardPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController cardNumber;
  late TextEditingController cardDate;
  late TextEditingController cardName;
  late TextEditingController cvv;

  @override
  void initState() {
    cardNumber = MaskedTextController(mask: '0000 0000 0000 0000');
    cardDate = MaskedTextController(mask: '00/00');
    cardName = TextEditingController();
    cvv = MaskedTextController(mask: '000');

    super.initState();
  }

  @override
  void dispose() {
    cardNumber.dispose();
    cardDate.dispose();
    cardName.dispose();
    cvv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(cardProvider.notifier);
    return Scaffold(
      body: KeyboardDismisser(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ResponsiveAppBar(
                  title: "Add New Card",
                  suffix: IconButton(
                      splashRadius: 26.r,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.svgMoreCircle,
                        height: 28.r,
                        width: 28.r,
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        REdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCard(),
                        24.verticalSpace,
                        Padding(
                          padding:
                              REdgeInsets.only(left: 6, top: 24, bottom: 6),
                          child: Text(
                            "Card Name",
                            style: GMedicalStyle.urbanistSemiBold(),
                          ),
                        ),
                        CustomTextField(
                          onChanged:  notifier.changeName,
                          textInputAction: TextInputAction.next,
                          validator: CardUtils.validateEmpty,
                        ),
                        Padding(
                          padding:
                              REdgeInsets.only(left: 6, top: 24, bottom: 6),
                          child: Text(
                            "Card Number",
                            style: GMedicalStyle.urbanistSemiBold(),
                          ),
                        ),
                        CustomTextField(
                          controller: cardNumber,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: notifier.changeNumber,
                          validator: CardUtils.validateCardNum,
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        REdgeInsets.only(left: 6, bottom: 6),
                                    child: Text(
                                      "Expiry Date",
                                      style: GMedicalStyle.urbanistSemiBold(),
                                    ),
                                  ),
                                  CustomTextField(
                                    controller: cardDate,
                                    textInputType: TextInputType.number,
                                    onChanged: notifier.changeDate,
                                    validator: CardUtils.validateDate,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ],
                              ),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        REdgeInsets.only(left: 6, bottom: 6),
                                    child: Text(
                                      "CVV",
                                      style: GMedicalStyle.urbanistSemiBold(),
                                    ),
                                  ),
                                  CustomTextField(
                                    controller: cvv,
                                    onChanged: notifier.changeCvv,
                                    validator: CardUtils.validateEmpty,
                                    textInputType: TextInputType.number,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        100.verticalSpace,
                        ConfirmButton(
                            onTap: () {
                              if(formKey.currentState?.validate() ?? false) {
                                notifier.setCard(() {
                                  ref.read(paymentProvider.notifier).getCards();
                                  Navigator.pop(context);
                                });
                              }
                            },
                            isLoading: false,
                            title: "Add New Card"),
                        36.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
