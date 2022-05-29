// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:developer';

import 'package:cart_greek/models/homeDataModel/homeDataResponse.dart';
import 'package:cart_greek/provider/connectivityProvider/connectivity_provider.dart';
import 'package:cart_greek/provider/futuredataProvider/futureDataProvider.dart';
import 'package:cart_greek/screens/EmptyScreen/empty_screen.dart';
import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/utils/shimmer/homePageShimmer.dart';
import 'package:cart_greek/utils/size_config.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FutureDataProvider, ConnectivityProvider>(
        builder: (context, dataProvider, connectivity, child) {
      return connectivity.isOnline
          ? Scaffold(
              backgroundColor: textColorWhite,
              body: SafeArea(
                child: FutureBuilder(
                    future: dataProvider.homeData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              categoryShimmer(1, 4),
                              sliderShimmer(context),
                              topSellerShimmer(context, 8),
                              topSellerShimmer(context, 8)
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return EmptyScreen();
                      } else if (snapshot.hasData) {
                        final homeDataResponse =
                            homeDataResponseFromJson(snapshot.data.toString());
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 36,
                          ),
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (scrollNotification) {
                              if (scrollNotification.metrics.pixels > 2) {
                                if (dataProvider.appbarVisibility) {
                                  dataProvider.appBarInvisible();
                                }
                              } else {
                                dataProvider.appbarVisible();
                              }

                              return true;
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 53,
                                          width: 53,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(26),
                                              border: Border.all(
                                                  color: primaryColors,
                                                  width: 1)),
                                          child: Image(
                                            image: AssetImage(
                                              "images/png/profilePic.png",
                                            ),
                                            fit: BoxFit.fill,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: "Welcome",
                                            textSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: textColorGrey,
                                            maxline: 1,
                                            align: TextAlign.left,
                                          ),
                                          TextWidget(
                                            text: "Emily Cyrus",
                                            textSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: textColorLigthtPink,
                                            maxline: 1,
                                            align: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  _babysettingServicesPoster(),
                                  _currentBookingWidget(homeDataResponse),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextWidget(
                                    text: "Package",
                                    textSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: textColorBlack,
                                    maxline: 1,
                                    align: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 124,
                                          width: SizeConfig.fullWidth! * 0.85,
                                          margin:
                                              const EdgeInsets.only(right: 32),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: index % 2 != 0
                                                  ? textColorLightBlue
                                                  : primaryColors),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12,
                                                right: 7,
                                                top: 12,
                                                bottom: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      "images/png/calender.png",
                                                      width: 24.5,
                                                      height: 24.5,
                                                      color: index % 2 != 0
                                                          ? textColorWhite
                                                          : textColorLigthtPink,
                                                    ),
                                                    // Icon(
                                                    //   Icons
                                                    //       .calendar_view_week_rounded,
                                                    //   color: index % 2 != 0
                                                    //       ? textColorWhite
                                                    //       : textColorLigthtPink,
                                                    //   size: 25,
                                                    // ),
                                                    Container(
                                                      width: 72,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: index % 2 != 0
                                                              ? textColorBlue
                                                              : textColorLigthtPink),
                                                      alignment:
                                                          Alignment.center,
                                                      child: TextWidget(
                                                        text: 'Book Now',
                                                        textSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: textColorWhite,
                                                        maxline: 1,
                                                        align: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextWidget(
                                                      text: homeDataResponse
                                                          .packages![index]
                                                          .packageName!,
                                                      textSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: textColorParple,
                                                      maxline: 1,
                                                      align: TextAlign.center,
                                                    ),
                                                    TextWidget(
                                                      text:
                                                          '₹ ${homeDataResponse.packages![index].price!}',
                                                      textSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: textColorParple,
                                                      maxline: 1,
                                                      align: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                TextWidget(
                                                  text: homeDataResponse
                                                      .packages![index]
                                                      .description!,
                                                  textSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: textColorParple,
                                                  maxline: 2,
                                                  align: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, ind) {
                                        return SizedBox(
                                          height: 15,
                                        );
                                      },
                                      itemCount:
                                          homeDataResponse.packages!.length),
                                  SizedBox(
                                    height: 65,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return EmptyScreen();
                      }
                    }),
              ),
            )
          : Container();
    });
  }

  Widget _babysettingServicesPoster() {
    return Stack(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(width: SizeConfig.fullWidth!),
              Container(
                height: 150,
                width: SizeConfig.fullWidth! * 0.85,
                margin: const EdgeInsets.only(right: 32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColors, width: 1),
                    color: primaryColors),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.fullWidth! * 0.3 / 2,
                      ),
                      Container(
                        width: 150,
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: 'Nany and',
                          textSize: 18,
                          fontWeight: FontWeight.w700,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        // width: 150,
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: 'Babysetting Services',
                          textSize: 18,
                          fontWeight: FontWeight.w700,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 75,
                        height: 21,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: textColorParple),
                        alignment: Alignment.center,
                        child: TextWidget(
                          text: 'Book Now',
                          textSize: 12,
                          fontWeight: FontWeight.w700,
                          color: textColorWhite,
                          maxline: 1,
                          align: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: -10,
            child: SizedBox(
              height: SizeConfig.fullWidth! * 0.6,
              // width: SizeConfig.fullWidth! * 0.8,
              child: Image(
                //width: ,
                image: AssetImage(
                  "images/png/stackImg.png",
                ),
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }

  Widget _currentBookingWidget(HomeDataResponse homeDataResponse) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 4,
          ),
          TextWidget(
            text: "Your Current Booking",
            textSize: 20,
            fontWeight: FontWeight.w700,
            color: textColorBlack,
            maxline: 1,
            align: TextAlign.left,
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 3,
            child: SizedBox(
              height: 170,
              width: SizeConfig.fullWidth! * 0.85,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 12, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: homeDataResponse.currentBookings!.packageLabel!,
                          textSize: 16,
                          fontWeight: FontWeight.w500,
                          color: textColorLigthtPink,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                        Container(
                          width: 70,
                          height: 19,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: textColorLigthtPink),
                          alignment: Alignment.center,
                          child: TextWidget(
                            text: 'Start',
                            textSize: 12,
                            fontWeight: FontWeight.w500,
                            color: textColorWhite,
                            maxline: 1,
                            align: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'From',
                                  textSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: textColorGrey,
                                  maxline: 1,
                                  align: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_sharp,
                                      color: textColorLigthtPink,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: homeDataResponse
                                          .currentBookings!.fromDate!,
                                      textSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textColorGrey,
                                      maxline: 1,
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "images/png/clock.png",
                                      width: 9,
                                      height: 9,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: homeDataResponse
                                          .currentBookings!.fromTime!,
                                      textSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textColorGrey,
                                      maxline: 1,
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'To',
                                  textSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: textColorGrey,
                                  maxline: 1,
                                  align: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_sharp,
                                      color: textColorLigthtPink,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: homeDataResponse
                                          .currentBookings!.toDate!,
                                      textSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textColorGrey,
                                      maxline: 1,
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "images/png/clock.png",
                                      width: 9,
                                      height: 9,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: homeDataResponse
                                          .currentBookings!.toTime!,
                                      textSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: textColorGrey,
                                      maxline: 1,
                                      align: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 19,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: textColorParple),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border,
                                color: textColorWhite,
                                size: 15,
                              ),
                              SizedBox(
                                width: 2.5,
                              ),
                              TextWidget(
                                text: 'Rate Us',
                                textSize: 11,
                                fontWeight: FontWeight.w700,
                                color: textColorWhite,
                                maxline: 1,
                                align: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 88,
                          height: 19,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: textColorParple),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: textColorWhite,
                                size: 15,
                              ),
                              SizedBox(
                                width: 2.5,
                              ),
                              TextWidget(
                                text: 'Geolocation',
                                textSize: 11,
                                fontWeight: FontWeight.w700,
                                color: textColorWhite,
                                maxline: 1,
                                align: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 83,
                          height: 19,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: textColorParple),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.supervised_user_circle,
                                color: textColorWhite,
                                size: 15,
                              ),
                              SizedBox(
                                width: 2.5,
                              ),
                              TextWidget(
                                text: 'Survillance',
                                textSize: 11,
                                fontWeight: FontWeight.w700,
                                color: textColorWhite,
                                maxline: 1,
                                align: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
