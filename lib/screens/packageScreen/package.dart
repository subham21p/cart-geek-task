// ignore_for_file: prefer_const_constructors

import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextWidget(
            text: "Package",
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
