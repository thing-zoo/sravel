import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class AddBlockFrame extends StatelessWidget {
  AddBlockFrame({
    Key? key,
    required this.content,
  }) : super(key: key);

  Row content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(7.0.w, 7.h, 0.0.w, 7.h),
      child: OutlinedButton(
        child: content,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
          // ),
          // padding: EdgeInsets.fromLTRB(14.0.w, 10.0.h, 14.0.w, 10.0.h),
          // margin: EdgeInsets.fromLTRB(7.0.w, 7.h, 0.0.w, 7.h),
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          primary: Colors.black,
          //padding: EdgeInsets.fromLTRB(14.0.w, 10.0.h, 14.0.w, 10.0.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )
        ),

      ),
    );
  }
}

List<Widget> AddBlock = [
  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.format_color_text,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("텍스트"),
        ],
      )
  ),

  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.format_color_text_outlined,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("제목 텍스트"),
        ],
      )
  ),

  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("이미지"),
        ],
      )
  ),

  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.face,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("이모지"),
        ],
      )
  ),

  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.attach_money,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("비용"),
        ],
      )
  ),

  AddBlockFrame(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: 16.w,
          ),
          SizedBox(
            width: 9.0.w,
          ),
          Text("위치"),
        ],
      )
  ),

];