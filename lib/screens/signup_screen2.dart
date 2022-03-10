import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sravel/models/user.dart';
import 'package:sravel/utils/constants.dart';
import 'package:sravel/utils/validate.dart';
import 'package:sravel/widgets/dropdown_date_picker.dart';
import 'package:sravel/widgets/rounded_button.dart';
import 'package:sravel/widgets/input_field.dart';

class SignUpPage2 extends StatefulWidget {
  SignUpPage2({Key? key}) : super(key: key);

  static final now = DateTime.now();

  final dropdownDatePicker = DropdownDatePicker(
    year: now.year,
    month: now.month,
    day: now.day,
  );

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nicknameController = TextEditingController();
  final _nicknameFocus = FocusNode();
  final _newUser = User();

  final List<bool> _isChecked = List.filled(4, false);

  void _submit() {
    _formKey.currentState!.save();
    _newUser.birthday = DateTime(widget.dropdownDatePicker.getYear,
        widget.dropdownDatePicker.getMonth, widget.dropdownDatePicker.getDay);
    _newUser.printProperties();
    //백으로 데이터 전송!
    Fluttertoast.showToast(
      msg: '가입이 성공적으로 완료되었습니다! 🥳',
      gravity: ToastGravity.TOP,
      backgroundColor: kPrimaryColor,
    );
  }
  
  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(35.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity, //가로 꽉차게
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '함께하게 되어 영광이에요✨\n당신에 대해 조금 더 알아가고싶어요.',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ), //테두리
              Column(
                children: [
                  InputForm(
                    controller: _nicknameController,
                    label: '닉네임',
                    keyboardType: TextInputType.text,
                    hint: '닉네임을 입력해 주세요.',
                    helper: '• 특수문자 제외 2~10자 이내로 입력해주세요.',
                    focusNode: _nicknameFocus,
                    validator: (value) =>
                        CheckValidate().validateNickname(_nicknameFocus, value),
                    onSaved: (newValue) => _newUser.nickname = newValue,
                    suffix: RoundedButton(
                      onPressed: _nicknameController.value.text.isNotEmpty
                          ? () {
                              //중복 확인
                            }
                          : null,
                      child: Text(
                        '중복 확인',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              _buildGender(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(
                      '생일',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  widget.dropdownDatePicker,
                ],
              ),
              _buildPrivateAgreement(),
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  radius: 10,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_isChecked[1] && _isChecked[2]) {
                        _submit();
                      } else {
                        Fluttertoast.showToast(
                          msg: '필수 항목에 동의해주세요 🥺',
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.grey,
                        );
                      }
                    }
                  },
                  child: Text(
                    '가입완료!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                  paddging: EdgeInsets.symmetric(vertical: 11.w),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '성별',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              _buildRadio(Gender.male, '남성'),
              _buildRadio(Gender.female, '여성'),
              _buildRadio(Gender.none, '나중에요!')
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadio(Gender value, String label) {
    return Padding(
      padding: EdgeInsets.only(right: 34.w),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SizedBox(
              width: 16.w,
              height: 16.h,
              child: Radio(
                value: value,
                groupValue: _newUser.gender,
                onChanged: (Gender? val) {
                  setState(() {
                    _newUser.gender = val;
                  });
                },
                activeColor: kPrimaryColor,
              ),
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildPrivateAgreement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [
              _buildCheck(
                  0,
                  Text(
                    '모두 동의합니다.',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            children: [
              _buildCheck(
                  1,
                  Text(
                    '이용약관 동의(필수)',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )),
              _buildCheck(
                2,
                Text(
                  '개인정보 취급방침 동의(필수)',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              _buildCheck(
                  3,
                  Text(
                    '마케팅 정보 수신 동의',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheck(int index, Widget label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w),
      child: Row(
        children: [
          CheckBoxFormField(
            isChecked: _isChecked[index],
            label: label,
            onChanged: (bool? value) {
              setState(() {
                if (index == 0) {
                  //모두 동의
                  _isChecked.setAll(0, [value!, value, value, value]);
                } else {
                  _isChecked[index] = value!;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
