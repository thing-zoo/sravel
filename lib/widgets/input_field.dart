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
    this.onSaved,
    this.suffix,
    this.padding,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final TextInputType keyboardType;
  final String? hint;
  final String? helper;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(bottom: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextFormField(
            // autovalidateMode: AutovalidateMode.onUserInteraction,  //실시간 유효성 검사
            controller: widget.controller,
            obscureText: widget.obscureText, //비밀번호 안보이게
            keyboardType: widget.keyboardType,
            decoration:
                _textFormDecoration(widget.hint, widget.helper, widget.suffix),
            focusNode: widget.focusNode,
            validator: widget.validator,
            onSaved: widget.onSaved,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

InputDecoration _textFormDecoration(hintText, helperText, suffix) {
  return InputDecoration(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 2.w),
    ),
    contentPadding: EdgeInsets.all(2.w),
    helperStyle: TextStyle(
      color: kPrimaryColor,
      fontSize: 11.sp,
    ),
    errorStyle: TextStyle(fontSize: 11.sp, color: Colors.red),
    hintText: hintText,
    helperText: helperText,
    suffix: suffix,
  );
}

class CheckBoxFormField extends FormField<bool> {
  final bool isChecked;
  final Widget label;
  final void Function(bool?) onChanged;
  CheckBoxFormField({
    Key? key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
    FormFieldValidator<bool>? validator,
  }) : super(
          key: key,
          initialValue: isChecked,
          validator: validator,
          builder: (field) {
            void onChangedHandler(bool? value) {
              field.didChange(value);
              onChanged(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Checkbox(
                          activeColor: kPrimaryColor,
                          value: isChecked,
                          shape: const CircleBorder(),
                          onChanged: onChangedHandler,
                        ),
                      ),
                    ),
                    label,
                  ],
                ),
                field.isValid
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          field.errorText ?? "",
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 13.0,
                          ),
                        ),
                      ),
              ],
            );
          },
        );

  @override
  _CheckBoxFormFieldState createState() => _CheckBoxFormFieldState();
}

class _CheckBoxFormFieldState extends FormFieldState<bool> {
  @override
  CheckBoxFormField get widget => super.widget as CheckBoxFormField;

  @override
  void didChange(bool? value) {
    super.didChange(value);
  }
}
