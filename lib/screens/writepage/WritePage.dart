import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:writepage/BlockSelectDialog.dart';

import 'package:writepage/block.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final List<int> _items = List<int>.generate(BlockList.length, (int index) => index);
  bool blockAddButtonOnTap = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: 375.w,
          height: 110.h,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),

          child: Placeholder(),
        ),
      ),

      body: Container(
        color: Color(0xFFF4F4F4),
        child: Stack(
          children: [
            Positioned(
              top: 25.5.h,
              left: 0.w,
              child: Container(
                height: 702.h,
                width: 375.w,
                child: ReorderableListView(
                  children: <Widget>[
                    for (int index = 0; index < _items.length; index += 1)
                      BlockList[_items[index]]
                  ],
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final int item = _items.removeAt(oldIndex);
                      _items.insert(newIndex, item);
                    });
                  },
                ),
              )
            ),

            Positioned(
              bottom: 0.h,
              left: 0.w,
              child: Container(
                width: 375.w,
                height: 66.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: Offset(0, -5), // changes position of shadow
                    ),
                  ],
                ),

                child: GestureDetector(
                  child: blockAddButtonOnTap ?
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,

                    color: Color(0xFF5F5BF5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : <Widget>[
                          Text(
                            "블럭 추가",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(
                            width: 6.67.w,
                          ),
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ]
                    ),
                  ):
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,

                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children : <Widget>[
                        Text(
                          "블럭 추가",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color(0xFF5F5BF5),
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          width: 6.67.w,
                        ),
                        Icon(
                          Icons.add_circle,
                          color: Color(0xFF5F5BF5),
                        ),
                      ]
                    ),
                  ),

                  onTapDown: (val){
                    setState(() {
                      blockAddButtonOnTap = true;
                    });
                  },
                  onTapUp: (val){
                    setState(() {
                      blockAddButtonOnTap = false;
                      Get.dialog(BlockSelectDialog());
                    });
                  },
                  onTapCancel: (){
                    setState(() {
                      blockAddButtonOnTap = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}