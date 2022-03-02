import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/utils/constants.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.hint,
    this.helper,
    this.focusNode,
    this.obscureText = false,
    this.validator,
    required this.onSaved,
    this.suffix,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final TextInputType keyboardType;
  final String? hint;
  final String? helper;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;
  final Widget? suffix;

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText, //비밀번호 안보이게
          keyboardType: widget.keyboardType,
          decoration: _textFormDecoration(widget.hint, widget.helper, widget.suffix),
          focusNode: widget.focusNode,
          validator: widget.validator,
          onSaved: widget.onSaved,
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}

InputDecoration _textFormDecoration(hintText, helperText, suffix) {
  return InputDecoration(
    contentPadding: EdgeInsets.all(2.w),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 2.w)),
    hintText: hintText,
    helperText: helperText,
    helperStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 11.sp,
    ),
    errorStyle: TextStyle(fontSize: 11.sp, color: Colors.red),
    suffix: suffix,
  );
}
