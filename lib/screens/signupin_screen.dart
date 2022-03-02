import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/screens/signin_screen.dart';
import 'package:sravel/screens/signup_screen.dart';
import 'package:sravel/utils/constants.dart';

class SignUpInPage extends StatefulWidget {
  const SignUpInPage({Key? key}) : super(key: key);

  @override
  _SignUpInPageState createState() => _SignUpInPageState();
}

class _SignUpInPageState extends State<SignUpInPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 1,
      length: 2,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52.h, //탭바 사이즈: 48정도, 앱바 사이즈: 100으로 통일
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kPrimaryColor, //밑줄
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: kPrimaryColor, //글자
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
          unselectedLabelColor: Colors.black26,
          tabs: const [
            Tab(
              text: '   회원가입   ', //indicator
            ),
            Tab(
              text: '   로그인   ',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SignUpPage(),
          SignInPage(),
        ],
      ),
    );
  }
}
