// ignore_for_file: prefer_const_constructors

import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColorWhite,
      body: SafeArea(
        child: Center(
          child: TextWidget(
            text: "Profile",
            textSize: 20,
            fontWeight: FontWeight.w700,
            color: textColorBlack,
            maxline: 1,
            align: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
