import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/utils/constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                'images/main_back.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '안녕하세요, 우영연님!',
                style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '오늘은 어떤 하루를 보내셨나요?',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.create),
                label: Text('노트쓰기'),
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16.sp),
                    padding: EdgeInsets.fromLTRB(30.w, 15.w, 30.w, 15.w),
                    primary: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
