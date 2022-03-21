import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sravel/models/user.dart';
import 'package:sravel/utils/constants.dart';
import 'package:sravel/utils/validate.dart';
import 'package:sravel/widgets/rounded_button.dart';
import 'package:sravel/widgets/input_field.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({Key? key}) : super(key: key);

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _passwordCheckFocus = FocusNode();

  bool _passwordObscure = true;
  bool _passwordCheckObscure = true;

  final _newUser = User();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _newUser.printProperties();
      //다음 페이지
      Get.toNamed('/signup2', id: 1);
    }
  }

  bool _isNotFormEmpty(
      TextEditingController email, TextEditingController password) {
    return email.value.text.isNotEmpty && password.value.text.isNotEmpty
        ? true
        : false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                    '스-하! 👋\n간단하게 몇 가지만 여쭤볼게요.',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Column(
                children: [
                  InputForm(
                    controller: _emailController,
                    label: '아이디(이메일)',
                    keyboardType: TextInputType.emailAddress,
                    hint: 'abc@sravel.com',
                    helper: '• 비밀번호 찾기에서 활용되니, 꼭 정확하게 입력 해주세요!',
                    focusNode: _emailFocus,
                    validator: (value) =>
                        CheckValidate().validateEmail(_emailFocus, value),
                    onSaved: (newValue) => _newUser.email = newValue,
                    suffix: RoundedButton(
                      onPressed: _emailController.value.text.isNotEmpty
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
                  ),
                  InputForm(
                    controller: _passwordController,
                    label: '비밀번호',
                    keyboardType: TextInputType.visiblePassword,
                    hint: '비밀번호를 입력하세요.',
                    helper: '• 특수문자, 대소문자, 숫자 포함 8~15자 이내로 입력해주세요.',
                    focusNode: _passwordFocus,
                    obscureText: _passwordObscure,
                    validator: (value) =>
                        CheckValidate().validatePassword(_passwordFocus, value),
                    onSaved: (newValue) => _newUser.password = newValue,
                    suffix: IconButton(
                      icon: Icon(_passwordObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _passwordController.value.text.isNotEmpty
                          ? () {
                              setState(() {
                                _passwordObscure = !_passwordObscure;
                              });
                            }
                          : null,
                    ),
                  ),
                  InputForm(
                    controller: _passwordCheckController,
                    label: '비밀번호 확인',
                    keyboardType: TextInputType.visiblePassword,
                    hint: '비밀번호를 한 번 더 입력해 주세요.',
                    focusNode: _passwordCheckFocus,
                    obscureText: _passwordCheckObscure,
                    validator: (value) => CheckValidate().validatePasswordCheck(
                        _passwordCheckFocus,
                        value,
                        _passwordController.value.text),
                    suffix: IconButton(
                      icon: Icon(_passwordCheckObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _passwordCheckController.value.text.isNotEmpty
                          ? () {
                              setState(() {
                                _passwordCheckObscure = !_passwordCheckObscure;
                              });
                            }
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  radius: 10,
                  onPressed:
                      _isNotFormEmpty(_emailController, _passwordController)
                          ? () => _submit()
                          : null,
                  child: Text(
                    '다 했어요!',
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
}
