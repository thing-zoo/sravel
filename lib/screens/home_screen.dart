import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/widgets/box_slider.dart';
import 'package:sravel/widgets/rounded_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/main_back.png',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30.w),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'HOXY 기록하러 들어왔어요?\n역시 당신이란 사람...😜',
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '\'가끔의 여행은 평생의 원동력!\' ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '- 눈떠보니제주',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RoundedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('기록하기'),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Icon(Icons.create),
                              ],
                            ),
                            paddging:
                                EdgeInsets.fromLTRB(30.w, 15.w, 30.w, 15.w),
                            onPressed: () {
                              /* 노트페이지로 이동 */
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const BoxSlider(),
      ],
    );
  }
}
