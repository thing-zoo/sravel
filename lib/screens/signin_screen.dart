import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sravel/models/user.dart';
import 'package:sravel/utils/constants.dart';
import 'package:sravel/widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/widgets/sns_button.dart';

import '../utils/validate.dart';
import '../widgets/input_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _passwordObscure = true;

  final _newUser = User();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _newUser.printProperties();
      //백으로 데이터 전송!
      Fluttertoast.showToast(
        msg: '로그인 성공 ~ 🥳',
        gravity: ToastGravity.TOP,
        backgroundColor: kPrimaryColor,
      );
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
              Column(
                children: [
                  InputForm(
                    controller: _emailController,
                    label: '아이디(이메일)',
                    keyboardType: TextInputType.emailAddress,
                    hint: 'abc@sravel.com',
                    focusNode: _emailFocus,
                    validator: (value) =>
                        CheckValidate().validateEmail(_emailFocus, value),
                    onSaved: (newValue) => _newUser.email = newValue,
                  ),
                  InputForm(
                    controller: _passwordController,
                    label: '비밀번호',
                    keyboardType: TextInputType.visiblePassword,
                    hint: '비밀번호를 입력하세요.',
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
                  SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                      onPressed:
                          _isNotFormEmpty(_emailController, _passwordController)
                              ? () => _submit()
                              : null,
                      child: const Text('로그인'),
                      radius: 10.r,
                      paddging: EdgeInsets.symmetric(vertical: 16.w),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.w),
                    child: Text(
                      '더 간편하게👀',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildSNS(
                        () {},
                        Image.asset('assets/images/kakao.png'),
                        '카카오로그인',
                        Colors.black,
                        const Color(0xFFF7E600),
                      ),
                      buildSNS(
                        () {},
                        Image.asset('assets/images/google.png'),
                        'Google로그인',
                        Colors.white,
                        Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildSNS(
                        () {},
                        Image.asset('assets/images/naver.png'),
                        '네이버로그인',
                        Colors.white,
                        const Color(0xFF2DB400),
                      ),
                      buildSNS(
                        () {},
                        const Icon(Icons.apple),
                        'Apple로그인',
                        Colors.white,
                        Colors.black,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
