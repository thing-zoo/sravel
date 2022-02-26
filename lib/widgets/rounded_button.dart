import 'package:flutter/material.dart';
import 'package:sravel/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? paddging;
  final Function()? onPressed;

  const RoundedButton({
    required this.onPressed,
    required this.child,
    this.paddging,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        padding: paddging,
        primary: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
