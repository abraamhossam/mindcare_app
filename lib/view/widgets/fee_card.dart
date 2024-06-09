import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';

class FeeCard extends StatelessWidget {
  const FeeCard({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.price,
    this.ontap,
  });

  final Size size;
  final String title;
  final String subTitle;
  final IconData icon;
  final double price;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: InkWell(
        onTap: ontap,
        child: Card(
            color: kPrimaryColor,
            elevation: 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: Container(
                    height: 70,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 231, 238),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          subTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$$price",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
