import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/models/mock_data.dart';

class BoxSlider extends StatelessWidget {
  const BoxSlider({Key? key}) : super(key: key);

  // final List<Post> posts;
  // BoxSlider({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '요즘 여기 핫해핫해🔥',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '더보기',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 10.w,
                      color: Colors.black,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10.w),
            height: 270.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context) {
  List<Widget> results = [];

  for (var i = 0; i < 3; i++) {
    results.add(InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     // fullscreenDialog: true,
          //     builder: (_) {
          //   return DetailScreen(
          //     movie: posts[i],
          //   );
          // }));
        },
        child: Container(
          width: 130.w,
          padding: EdgeInsets.only(right: 10.w),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  mockData["items"][i]["poster"],
                ),
              ),
              SizedBox(height: 6.w),
              Text(
                mockData["items"][i]["title"],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
              SizedBox(height: 5.w),
              Text(
                mockData["items"][i]["content"],
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        )));
  }

  return results;
}
