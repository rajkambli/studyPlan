import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studyplan/screens/success_alert.dart';


import '../utility/constant.dart';
import '../utility/google_sign_in.dart';
import '../utility/utility.dart';
import '../widgets/button_blue.dart';
import '../widgets/svg.widget.dart';
import '../widgets/text.box.widget.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mail = "";
  String pass = "";
  bool isChecked = false;


  Future<void> googleSign() async {

    final GoogleSignInAccount? googleUser = await GoogleSignInApi.login();

    if (googleUser != null) {
      String email = googleUser.email;
      String name = googleUser.displayName.toString();
      String image = googleUser.photoUrl.toString();
      print(email);
      print(name);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessAlert()), // Replace HomePage with your actual page
      );
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }




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
                    Text("Log In", style: TextStyle(
                        fontFamily: Constant.font,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Utility.getHexColor("1F1F39")
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){

                        },
                        child: Text("Forget Password ?", style: TextStyle(
                            fontFamily: Constant.font,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Utility.getHexColor("B8B8D2")
                        ),),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ButtonBlue(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const SuccessAlert(),
                            ));
                      },
                      name: "Log In",),
                    const SizedBox(height: 20,),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Dont have an account ?  ',
                          style:  TextStyle(
                              fontFamily: Constant.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Utility.getHexColor("B8B8D2")
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  fontFamily: Constant.font,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color:  Utility.getHexColor("3D5CFF")),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle terms of service tap
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (BuildContext context) => const TermsCondition(),
                                  //     ));
                                },
                            ),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                        children: <Widget>[
                          const Expanded(
                              child: Divider()
                          ),
                          const SizedBox(width: 10,),
                          Text("Or LogIn With ?", style: TextStyle(
                              fontFamily: Constant.font,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Utility.getHexColor("B8B8D2")
                          ),),
                          const SizedBox(width: 10,),
                          const Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: (){
                              googleSign();
                            },
                            child: SvgWidget(assetName: "icon_google.svg")),
                        const SizedBox(width: 20,),
                        InkWell(
                            onTap: () async {
                              try {
                                final UserCredential userCredential = await signInWithFacebook();
                                if (context.mounted) {

                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: SvgWidget(assetName: "icon_facebook.svg")),
                      ],
                    )
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
