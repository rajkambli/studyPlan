import 'package:flutter/material.dart';
import 'package:studyplan/utility/utility.dart';

import '../utility/constant.dart';
import '../widgets/button_blue.dart';
import '../widgets/svg.widget.dart';
import 'dashboard.dart';


class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[700], // Background color
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: 250.0, // Adjust width as per your need
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SvgWidget(assetName: "icon_mark.svg"),
              const SizedBox(height: 20.0),
              Text(
                'Success',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: Constant.font,
                  fontWeight: FontWeight.w600,
                    color: Utility.getHexColor("1F1F39")
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Congratulations, you have\ncompleted your registration!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                    color: Utility.getHexColor("B8B8D2")
                ),
              ),
              const SizedBox(height: 20.0),
              ButtonBlue(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Dashboard(),
                      ));
                },
                name: "Done",),
            ],
          ),
        ),
      ),
    );
  }
}
