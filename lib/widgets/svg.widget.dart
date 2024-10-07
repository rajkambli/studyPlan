import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? height;
  const SvgWidget({super.key, required this.assetName, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        "assets/images/$assetName",
      color: color,
      height: height,
    );
  }
}
