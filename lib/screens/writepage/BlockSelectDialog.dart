import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:writepage/BlockSelectDialog_Block.dart';

class BlockSelectDialog extends StatelessWidget {
  const BlockSelectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 86.0.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: AddBlock,
        ),
      ),
    );
  }
}

