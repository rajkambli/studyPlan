import 'package:flutter/material.dart';
import 'package:studyplan/utility/constant.dart';

import '../utility/utility.dart';



class ButtonBlue extends StatelessWidget {
  final String name;
  final Function() onTap;
  final double height;
  final double? width;

  const ButtonBlue({super.key,
    required this.name,
    required this.onTap,
    this.height = 50,
    this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
              color: Utility.getHexColor("3D5CFF")

          ),
          child: Center(
            child: Text(name,
              style: TextStyle(
                  fontFamily: Constant.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Utility.getHexColor("FFFFFF")
              ),
            ),
          )
      ),
    );
  }
}
