import 'package:flutter/material.dart';

import '../utility/constant.dart';
import '../utility/utility.dart';


class ButtonWhite extends StatelessWidget {
  final String name;
  final Function() onTap;
  final double height;
  final double? width;

  const ButtonWhite({super.key,
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
            color: Colors.transparent,
            border: Border.all(color: Utility.getHexColor("3D5CFF"))
          ),
          child: Center(
            child: Text(name,
              style: TextStyle(
                  fontFamily: Constant.font,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Utility.getHexColor("3D5CFF")
              ),
            ),
          )
      ),
    );
  }
}
