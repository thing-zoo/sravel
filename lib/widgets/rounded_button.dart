import 'package:flutter/material.dart';
import 'package:sravel/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final double radius;
  final EdgeInsetsGeometry? paddging;

  const RoundedButton({
    required this.onPressed,
    required this.child,
    this.radius = 20,
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
        // onSurface: ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
