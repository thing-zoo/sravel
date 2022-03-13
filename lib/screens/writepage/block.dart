import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

List<Widget> BlockList = <Widget>[
  Block(
    child: Text(
      "1",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0.sp,
      ),
    ),
    boxColor: Color(0xFF5F5BF5),
    key: UniqueKey(),
  ),

  Block(
    child: Text(
      "2",
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 14.0.sp,
      ),
    ),
    boxColor: Color(0xFF5F5BF5),
    key: UniqueKey(),
  ),

  Block(
    child: Text(
      "3",
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 14.0.sp,
      ),
    ),
    boxColor: Color(0xFF5F5BF5),
    key: UniqueKey(),
  ),

  Block(
    child: Text(
      "4",
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 14.0.sp,
      ),
    ),
    boxColor: Color(0xFF5F5BF5),
    key: UniqueKey(),
  ),
];


class Block extends StatelessWidget {
  Block({
    required Key key,
    required this.child,
    required this.boxColor,
  }) : super(key: key);

  Widget child;
  Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: EdgeInsets.fromLTRB(15.0.w, 16.0.h, 15.0.w, 16.0.h),
      margin: EdgeInsets.fromLTRB(18.0.w, 2.5.h, 19.0.w, 2.5.h),

      child: child,
    );
  }
}


class Block_Text extends StatelessWidget {
  const Block_Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Block(
      boxColor: Color(0xFF5F5BF5),
      child: ,
    );
  }
}
