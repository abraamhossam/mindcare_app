import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare_app/view/Doctors/widgets/shape.dart';


class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    super.key,
    required this.title,
    required this.desc, required this.indexpages,
  });
  final String title;
  final String desc;
  final String indexpages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
          // constraints: BoxConstraints(),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 9,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: Colors.blue,
              width: 1.5.w,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 45,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shape(indexpage: indexpages,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 45,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 230.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      Text(desc,
                          style: TextStyle(
                            color: const Color(0xFF8B9DB2),
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
