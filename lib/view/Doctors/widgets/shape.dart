import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shape extends StatelessWidget {
  const Shape({super.key, required this.indexpage});
  final String indexpage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: MediaQuery.of(context).size.width/10,
          // height: MediaQuery.of(context).size. height / 10,
          width: 55.w,
          height: 55.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Text(
                    // "1/5",
                    indexpage,
                    style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                  ),
                ),
                //  width: MediaQuery.of(context).size.width / 8,
                // height: MediaQuery.of(context).size.height /8,
                width: 55.w,
                height: 55.h,
                decoration: const ShapeDecoration(
                  color: Color.fromARGB(255, 231, 240, 248),
                  shape: OvalBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
