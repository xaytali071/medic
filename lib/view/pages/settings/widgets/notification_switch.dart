import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import '../../../companents/style.dart';



class NotificationSwitch extends StatelessWidget {
  final bool isActive;
  final Function(bool)? onChanged;
  final String title;

  const NotificationSwitch({
    Key? key,
    required this.isActive,
    this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GMedicalStyle.urbanistSemiBold(),
            ),
          ),
          CupertinoSwitch(
              activeColor: GMedicalStyle.primary, value: isActive, onChanged: onChanged)
        ],
      ),
    );
  }
}
