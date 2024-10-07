import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studyplan/screens/dashboard.dart';
import 'package:studyplan/screens/login.dart';
import 'package:studyplan/utility/constant.dart';
import 'package:studyplan/utility/utility.dart';
import 'package:studyplan/widgets/text.box.widget.dart';

import '../widgets/button_blue.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String mail = "";
  String pass = "";
  String name = "";
  bool isChecked = false;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utility.getHexColor("F4F3FD"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80,),
                    Text("Sign Up", style: TextStyle(
                        fontFamily: Constant.font,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Utility.getHexColor("1F1F39")
                    ),),
                    const SizedBox(height: 10,),
                    Text("Enter your details below & free sign up", style: TextStyle(
                        fontFamily: Constant.font,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Utility.getHexColor("B8B8D2")
                    ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: Utility.getHexColor("FFFFFF"),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Text("Email", style: TextStyle(
                        fontFamily: Constant.font,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Utility.getHexColor("B8B8D2")
                    ),),
                    TextBoxWidget(
                        isPrefixVisible: false,
                        originalText: mail,
                        hintText: "Enter your email",
                        onChanged: (val) {
                          mail = val;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ]
                    ),
                    Text("Password", style: TextStyle(
                        fontFamily: Constant.font,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Utility.getHexColor("B8B8D2")
                    ),),
                    TextBoxWidget(
                        isPrefixVisible: false,
                        isObscureEnabled: true,
                        originalText: mail,
                        hintText: "Enter your password",
                        onChanged: (val) {
                          mail = val;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter
                        ]
                    ),
                    const SizedBox(height: 20,),
                    ButtonBlue(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Dashboard(),
                            ));
                      },
                      name: "Create Account",),
                    const SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width:20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Utility.getHexColor("B8B8D2")
                              )
                          ),
                          child: Checkbox(
                            activeColor:  Utility.getHexColor("3D5CFF"),
                            focusColor: Utility.getHexColor("31D893"),
                            checkColor: Colors.white,
                            side: const BorderSide(width: 0,color:  Colors.transparent),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Text("By creating an account you have to agree with our them & condication.", style: TextStyle(
                              fontFamily: Constant.font,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Utility.getHexColor("B8B8D2")
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have account ?  ',
                          style:  TextStyle(
                              fontFamily: Constant.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Utility.getHexColor("B8B8D2")
                          ),
                          children: [
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                  fontFamily: Constant.font,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color:  Utility.getHexColor("3D5CFF")),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => const Login(),
                                      ));

                                },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
