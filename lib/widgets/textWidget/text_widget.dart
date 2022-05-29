// ignore_for_file: prefer_const_constructors

import 'package:cart_greek/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color color;
  final int maxline;
  final TextAlign align;
  final bool? enableShadow;
  final bool? textBold;
  final bool? underline;

  const TextWidget(
      {Key? key,
      required this.text,
      required this.textSize,
      required this.fontWeight,
      required this.color,
      this.enableShadow,
      required this.maxline,
      required this.align,
      this.textBold,
      this.underline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (textBold == true) ? text.toUpperCase() : text,
      overflow: TextOverflow.visible,
      maxLines: maxline,
      textAlign: align,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontFamily: "Alegreya Sans",
            fontSize: textSize,
            fontWeight: fontWeight,
            color: color,
            decoration: (underline == true)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor:
                (underline == true) ? Colors.red[800] : textColorBlack,
            shadows: (enableShadow != null && enableShadow == true)
                ? <Shadow>[
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 1.0,
                      color: Colors.black,
                    ),
                  ]
                : <Shadow>[],
          ),
    );
  }
}
