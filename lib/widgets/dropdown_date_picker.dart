import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sravel/utils/constants.dart';

// ignore: must_be_immutable
class DropdownDatePicker extends StatefulWidget {
  int year;
  int month;
  int day;

  int get getYear {
    return year;
  }

  int get getMonth {
    return month;
  }

  int get getDay {
    return day;
  }

  DropdownDatePicker({
    Key? key,
    required this.year,
    required this.month,
    required this.day,
  }) : super(key: key);

  @override
  State<DropdownDatePicker> createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  final int firstYear = 1950;
  final int lastYear = DateTime.now().year;
  final bool ascending = true;

  Iterable<int> _intGenerator(int start, int end, bool ascending) sync* {
    if (ascending) {
      for (var i = start; i <= end; i++) {
        yield i;
      }
    } else {
      for (var i = end; i >= start; i--) {
        yield i;
      }
    }
  }

  List<DropdownMenuItem<int>> _buildDropdownMenuItemList(int min, int max) {
    return _intGenerator(min, max, ascending)
        .map((i) => DropdownMenuItem(value: i, child: Text(i.toString())))
        .toList();
  }

  Widget _buildDropdownButton({
    required final int value,
    required final Function(int?) onChanged,
    required final List<DropdownMenuItem<int>> items,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: kPrimaryColor, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: onChanged,
          items: items,
          borderRadius: BorderRadius.circular(10.r),
          icon: const Icon(Icons.expand_more, color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget _buildYearDropdownButton() {
    return Container(
      // width: 89.w,
      height: 36.h,
      padding: EdgeInsets.only(right: 3.w),
      child: _buildDropdownButton(
        value: widget.year,
        items: _buildDropdownMenuItemList(firstYear, lastYear),
        onChanged: (int? year) {
          setState(() {
            widget.year = year!;
          });
        },
      ),
    );
  }

  Widget _buildMonthDropdownButton() {
    return Container(
      // width: 56.w,
      height: 36.h,
      padding: EdgeInsets.only(right: 3.w),
      child: _buildDropdownButton(
        value: widget.month,
        items: _buildDropdownMenuItemList(1, 12),
        onChanged: (int? month) {
          setState(() {
            widget.month = month!;
          });
        },
      ),
    );
  }

  Widget _buildDayDropdownButton() {
    return Container(
      // width: 56.w,
      height: 36.h,
      padding: EdgeInsets.only(right: 3.w),
      child: _buildDropdownButton(
        value: widget.day,
        items: _buildDropdownMenuItemList(1, 31),
        onChanged: (int? day) {
          setState(() {
            widget.day = day!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildYearDropdownButton(),
        Text('년', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(width: 10.w),
        _buildMonthDropdownButton(),
        Text('월', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(width: 10.w),
        _buildDayDropdownButton(),
        Text('일', style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
