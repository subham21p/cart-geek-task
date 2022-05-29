// ignore_for_file: prefer_const_constructors

import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget categoryShimmer(int count, int crossAxisCount) {
  return Padding(
    padding: const EdgeInsets.only(left: 32, right: 32),
    child: Container(
      //height: double.infinity,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: GridView.builder(
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 1 / 1.4),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(),
              header: AspectRatio(
                aspectRatio: 1 / 1,
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 0.2),
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 40,
                    minRadius: 30,
                    // backgroundImage:

                    //  AdvancedNetworkImage(data.image.url,
                    // useDiskCache: true,
                    // ),
                  ),
                ),
              ),
              // footer: Container(
              //     margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
              //     decoration: BoxDecoration(
              //         color: Colors.red, borderRadius: BorderRadius.circular(2)),
              //     height: 15,
              //     width: double.infinity,
              //     child: Align(
              //       alignment: Alignment.topCenter,
              //       child: Text(
              //         ' '.toUpperCase(),
              //         maxLines: 2,
              //         textAlign: TextAlign.center,
              //         style: Theme.of(context)
              //             .textTheme
              //             .bodyText1!
              //             .copyWith(fontSize: 12),
              //       ),
              //     )),
              // ),
            );
          },
        ),
      ),
    ),
  );
}

Widget sliderShimmer(context) {
  return AspectRatio(
    aspectRatio: 2.3,
    child: Container(
        margin: EdgeInsets.all(6),
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ))),
  );
}

Widget topSellerShimmer(context, count) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: Container(
            height: 30,
            width: SizeConfig.fullWidth! / 2,
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(
        height: SizeConfig.fullHeight! * 0.3,
        width: SizeConfig.fullWidth!,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: GridView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                itemCount: count,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.35,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 8.0, left: 4, right: 4),
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.zero,
                      child: Container(
                        width: SizeConfig.fullWidth,
                        padding: EdgeInsets.only(
                            left: 10, right: 5, top: 0, bottom: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: SizeConfig.fullHeight! * 0.12,
                              width: SizeConfig.fullHeight! * 0.12,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: primaryColorGrocery
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 2),
                                          child: Container(),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Card(
                                        elevation: 0.5,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Container()),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  SizedBox(height: 2),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
      ),
    ],
  );
}
