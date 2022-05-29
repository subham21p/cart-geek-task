// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class NoInternetscreen extends StatefulWidget {
  @override
  _NoInternetscreenState createState() => _NoInternetscreenState();
}

class _NoInternetscreenState extends State<NoInternetscreen> {
  // Map _source = {ConnectivityResult.none: false};
  String? string;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: Container(
                height: height * 0.5,
                width: width,
                child: Icon(
                  Icons.wifi_off,
                  size: 100,
                )),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.65),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("OOPS!",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                          //  Theme.of(context).textTheme.headline5!.copyWith(
                          //     fontWeight: FontWeight.bold, letterSpacing: 1.5)
                          ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("NO INTERNET",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("Please check your internet connection",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
