// ignore_for_file: prefer_const_constructors

import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextWidget(
            text: "Booking",
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
