import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sravel/utils/constants.dart';
import 'package:sravel/utils/validate.dart';
import 'package:sravel/widgets/rounded_button.dart';
import 'package:sravel/widgets/input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _emailText = '';
  var _passwordText = '';
  var _passwordCheckText = '';
  var _nicknameText = '';

  bool _passwordObscure = true;
  bool _passwordCheckObscure = true;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordCheckFocus = FocusNode();
  final FocusNode _nicknameFocus = FocusNode();

  final List<bool> _isChecked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(35.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              // buildInput(
              //   '아이디(이메일)',
              //   TextInputType.emailAddress,
              //   'abc@sravel.com',
              //   '• 비밀번호 찾기에서 활용되니, 꼭 정확하게 입력 해주세요!',
              //   _emailFocus,
              //   false,
              //   (value) => CheckValidate().validateEmail(_emailFocus, value),
              //   (text) => setState(() => _emailText = text),
              //   RoundedButton(
              //     onPressed: _emailText.isNotEmpty
              //         ? () {
              //             //중복 확인
              //           }
              //         : null,
              //     child: Text(
              //       '중복 확인',
              //       style: TextStyle(
              //         fontSize: 12.sp,
              //       ),
              //     ),
              //   ),
              // ),
              // buildInput(
              //   '비밀번호',
              //   TextInputType.visiblePassword,
              //   '비밀번호를 입력하세요.',
              //   '• 특수문자, 대소문자, 숫자 포함 8~15자 이내로 입력해주세요.',
              //   _passwordFocus,
              //   _passwordObscure,
              //   (value) =>
              //       CheckValidate().validatePassword(_passwordFocus, value),
              //   (text) => setState(() => _passwordText = text),
              //   IconButton(
              //     icon: Icon(_passwordObscure
              //         ? Icons.visibility_off
              //         : Icons.visibility),
              //     onPressed: _passwordText.isNotEmpty
              //         ? () {
              //             setState(() {
              //               _passwordObscure = !_passwordObscure;
              //             });
              //           }
              //         : null,
              //   ),
              // ),
              // buildInput(
              //   '비밀번호 확인',
              //   TextInputType.visiblePassword,
              //   '비밀번호를 한 번 더 입력해 주세요.',
              //   null,
              //   _passwordCheckFocus,
              //   _passwordCheckObscure,
              //   (value) => CheckValidate().validatePasswordCheck(
              //       _passwordCheckFocus, value, _passwordText),
              //   (text) => setState(() => _passwordCheckText = text),
              //   IconButton(
              //     icon: Icon(_passwordCheckObscure
              //         ? Icons.visibility_off
              //         : Icons.visibility),
              //     onPressed: _passwordCheckText.isNotEmpty
              //         ? () {
              //             setState(() {
              //               _passwordCheckObscure = !_passwordCheckObscure;
              //             });
              //           }
              //         : null,
              //   ),
              // ),
              // buildInput(
              //   '닉네임',
              //   TextInputType.text,
              //   '닉네임을 입력해 주세요.',
              //   '• 특수문자 제외 2~20자 이내로 입력해주세요.',
              //   _nicknameFocus,
              //   false,
              //   (value) =>
              //       CheckValidate().validateNickname(_nicknameFocus, value),
              //   (text) => setState(() => _nicknameText = text),
              //   RoundedButton(
              //     onPressed: _nicknameText.isNotEmpty
              //         ? () {
              //             //중복 확인
              //           }
              //         : null,
              //     child: Text(
              //       '중복 확인',
              //       style: TextStyle(
              //         fontSize: 12.sp,
              //       ),
              //     ),
              //   ),
              // ),
              _buildPrivateAgreement(),
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
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
                  child: const Text('입력 완료!'),
                  paddging: EdgeInsets.symmetric(vertical: 16.w),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildPrivateAgreement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildCheckbox(0),
            Text(
              '모두 동의합니다.',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  _buildCheckbox(1),
                  Text(
                    '이용약관 동의(필수)',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  _buildCheckbox(2),
                  Text(
                    '개인정보 취급방침 동의(필수)',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  _buildCheckbox(3),
                  Text(
                    '마케팅 정보 수신 동의',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(int index) {
    return SizedBox(
      width: 25.w,
      height: 25.w,
      child: Checkbox(
        activeColor: kPrimaryColor,
        value: _isChecked[index],
        shape: const CircleBorder(),
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
      ),
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    //백으로 데이터 전송!
    Fluttertoast.showToast(
      msg: '가입이 성공적으로 완료되었습니다! 🥳',
      gravity: ToastGravity.TOP,
      backgroundColor: kPrimaryColor,
    );
  }
}
