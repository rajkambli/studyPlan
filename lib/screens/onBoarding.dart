import 'package:flutter/material.dart';
import 'package:studyplan/screens/sign_up.dart';
import 'package:studyplan/utility/constant.dart';
import 'package:studyplan/utility/utility.dart';
import 'package:studyplan/widgets/button_blue.dart';
import 'package:studyplan/widgets/button_white.dart';
import 'package:studyplan/widgets/svg.widget.dart';

import 'login.dart';



class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              const Center(child: SvgWidget(assetName: "icon_boarding.svg")),
              const SizedBox(height: 20,),
              Text("Create your own \nstudy plan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Constant.font,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Utility.getHexColor("1F1F39")
              ),),
              const SizedBox(height: 20,),
              Text("Study according to the \nstudy plan, make study \nmore motivated", textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: Constant.font,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Utility.getHexColor("858597")
                ),),
              const SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(
                    child: ButtonBlue(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const SignUp(),
                            ));
                      },
                      name: "Sign Up",),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(child: ButtonWhite(name: "Log In", onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Login(),
                        ));
                  }))
                ],
              )
            ],
          ),
        ),
        // bottomSheet: Container(
        //   height: 40,
        //   padding: EdgeInsets.all(20),
        //   color: Colors.white,
        // ),
      ),
    );
  }
}
