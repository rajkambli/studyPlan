import 'package:flutter/material.dart';
import 'package:studyplan/utility/utility.dart';

import '../utility/constant.dart';
import '../widgets/svg.widget.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              Stack(

                alignment: const Alignment(0, 13),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Utility.getHexColor("3D5CFF"),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30), // Space for status bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, Kristin",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: Constant.font,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Let's start learning",
                                  style: TextStyle(
                                    color:Utility.getHexColor("FFFFFF"),
                                    fontFamily: Constant.font,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SvgWidget(assetName: "icon_avatar.svg"),
                            // CircleAvatar(
                            //   backgroundImage:
                            //   radius: 25,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(

                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Utility.getHexColor("F4F3FD"),
                            offset: const Offset(0, 3),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Learned today",
                                style: TextStyle(
                                    color: Utility.getHexColor("858597"),
                                    fontSize: 12,

                                    fontFamily: Constant.font,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                "My courses",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.font,
                                    color: Utility.getHexColor("3D5CFF")),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              text: '46min',
                              style: TextStyle(
                                color: Utility.getHexColor("1F1F39"),
                                fontFamily: Constant.font,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: ' / 60min',
                                  style: TextStyle(
                                    color: Utility.getHexColor("858597"),
                                    fontFamily: Constant.font,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 300, // Width of the progress bar
                            height: 5,  // Height of the progress bar
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.5, // Progress fraction goes here
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Utility.getHexColor("FFFFFF"),
                                      Utility.getHexColor("FF5106")
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,  // Number of pages in the PageView
                  itemBuilder: (context, index) {
                    return  Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: 260,
                            padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
                            decoration: BoxDecoration(
                              color: Utility.getHexColor("CEECFE"),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgWidget(
                                        height: 120,
                                        assetName: "banner.svg")),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("What do youwant to\nlearn today ?",
                                      style: TextStyle(
                                        color: Utility.getHexColor("1F1F39"),
                                        fontFamily: Constant.font,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    const SizedBox(height: 40,),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Utility.getHexColor("FF6905"),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text("Get started",style: TextStyle(
                                        color: Utility.getHexColor("FFFFFF"),
                                        fontFamily: Constant.font,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Learning Plan Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Learning Plan",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: Constant.font,
                        color: Utility.getHexColor("1F1F39"),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    
                    const SizedBox(height: 10),
                    // List of learning plans
                    Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            _buildLearningPlanItem("Packaging Design", 40, 48,0.5),
                            _buildLearningPlanItem("Product Design", 6, 24,0.3),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLearningPlanItem(String title, int progress, int total,double progressValue) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                value: progressValue,
                backgroundColor: Utility.getHexColor('F4F3FD'),
                valueColor: AlwaysStoppedAnimation<Color>(Utility.getHexColor("707070")),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style:  TextStyle(
                  color: Utility.getHexColor("1F1F39"),
                  fontFamily: Constant.font,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: '$progress',
            style: TextStyle(
              color: Utility.getHexColor("1F1F39"),
              fontFamily: Constant.font,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: ' / $total',
                style: TextStyle(
                  color: Utility.getHexColor("858597"),
                  fontFamily: Constant.font,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}