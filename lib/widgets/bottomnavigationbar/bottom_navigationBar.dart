// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cart_greek/provider/connectivityProvider/connectivity_provider.dart';
import 'package:cart_greek/provider/futuredataProvider/futureDataProvider.dart';
import 'package:cart_greek/screens/bookingScreen/booking.dart';
import 'package:cart_greek/screens/homeScreen/home.dart';
import 'package:cart_greek/screens/packageScreen/package.dart';
import 'package:cart_greek/screens/profileScreen/profile.dart';
import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/utils/size_config.dart';
import 'package:cart_greek/widgets/dialogs/exitPopupDialog.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  bool schedulerBinding;
  BottomNavBar({required this.schedulerBinding});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int count = 4, selectedValue = 0;
  bool hasAddress = false;

  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [HomeScreen(), PackageScreen(), BookingScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "images/png/homeIcon.png",
              width: 22,
              height: 22,
              color: textColorLigthtPink,
            ),
            TextWidget(
              text: "Home",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorLigthtPink,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "images/png/homeIcon.png",
              width: 22,
              height: 22,
              color: textColorGrey,
            ),
            TextWidget(
              text: "Home",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorGrey,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        title: "Home",
        activeColorPrimary: textColorLigthtPink,
        inactiveColorPrimary: textColorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "images/png/package.png",
              width: 22,
              height: 22,
              color: textColorLigthtPink,
            ),
            TextWidget(
              text: "Package",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorLigthtPink,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "images/png/package.png",
              width: 22,
              height: 22,
              color: textColorGrey,
            ),
            TextWidget(
              text: "Package",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorGrey,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        title: ("Package"),
        activeColorPrimary: textColorLigthtPink,
        inactiveColorPrimary: textColorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "images/png/clockIcon.png",
              width: 22,
              height: 22,
              color: textColorLigthtPink,
            ),
            TextWidget(
              text: "Booking",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorLigthtPink,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "images/png/clockIcon.png",
              width: 22,
              height: 22,
              color: textColorGrey,
            ),
            TextWidget(
              text: "Booking",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorGrey,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        title: ("Booking"),
        activeColorPrimary: textColorLigthtPink,
        inactiveColorPrimary: textColorGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "images/png/profile.png",
              width: 22,
              height: 22,
              color: textColorLigthtPink,
            ),
            TextWidget(
              text: "Profile",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorLigthtPink,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "images/png/profile.png",
              width: 22,
              height: 22,
              color: textColorGrey,
            ),
            TextWidget(
              text: "Profile",
              textSize: 10,
              fontWeight: FontWeight.w500,
              color: textColorGrey,
              maxline: 1,
              align: TextAlign.center,
            ),
          ],
        ),
        title: ("Profile"),
        activeColorPrimary: textColorLigthtPink,
        inactiveColorPrimary: textColorGrey,
      ),
    ];
  }

  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    bool value;
    return Consumer2<FutureDataProvider, ConnectivityProvider>(
        builder: (context, dataProvider, connectivity, child) {
      return connectivity.isOnline
          ? AdvancedDrawer(
              backdropColor: textColorWhite,
              controller: _advancedDrawerController,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              animateChildDecoration: true,
              rtlOpening: false,
              disabledGestures: false,
              childDecoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              drawer: ListTileTheme(
                textColor: textColorParple,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 39, top: 85),
                        child: Container(
                            width: 72.0,
                            height: 72.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                border:
                                    Border.all(color: primaryColors, width: 1)),
                            child: Image(
                              image: AssetImage(
                                "images/png/profilePicDr.png",
                              ),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 29, top: 11),
                        child: TextWidget(
                          text: "Emily Cyrus",
                          textSize: 20,
                          fontWeight: FontWeight.w700,
                          color: textColorLigthtPink,
                          maxline: 1,
                          align: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "Home",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "Book A Nanny",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "How It Works",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "Why Nanny Vanny",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "My Bookings",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "My Profile",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 0.5,
                        color: textColorLigthtPink,
                      ),
                      ListTile(
                        onTap: () {},
                        title: TextWidget(
                          text: "Support",
                          textSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textColorParple,
                          maxline: 1,
                          align: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Scaffold(
                // backgroundColor: primaryColor,
                appBar: dataProvider.appbarVisibility
                    ? AppBar(
                        elevation: 0,
                        backgroundColor: textColorWhite,

                        centerTitle: true,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: IconButton(
                              onPressed: _handleMenuButtonPressed,
                              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                                valueListenable: _advancedDrawerController,
                                builder: (_, value, __) {
                                  return AnimatedSwitcher(
                                      duration: Duration(milliseconds: 250),
                                      child: Image.asset(
                                        "images/png/menu.png",
                                        width: 35,
                                        height: 35,
                                        fit: BoxFit.fill,
                                      ));
                                },
                              ),
                            ),
                          ),
                        ],
                        //  leading:
                      )
                    : null,
                body: Container(
                  //  color: primaryColors,
                  child: PersistentTabView(
                    context,
                    controller: _controller,
                    screens: _buildScreens(),
                    items: _navBarsItems(),
                    confineInSafeArea: true,
                    backgroundColor: Colors.white.withOpacity(0.7),
                    handleAndroidBackButtonPress: true,
                    resizeToAvoidBottomInset: true,
                    stateManagement: true,
                    navBarHeight: 60,
                    //  MediaQuery.of(context).viewInsets.bottom > 0
                    //     ? 0.0
                    //     : kBottomNavigationBarHeight,
                    hideNavigationBarWhenKeyboardShows: true,
                    margin: EdgeInsets.all(0.0),
                    popActionScreens: PopActionScreensType.all,
                    bottomScreenMargin: 0.0,
                    onWillPop: (context) async {
                      value =
                          await showExitPopup(context!, SizeConfig.fullWidth!);
                      return value;
                    },

                    hideNavigationBar: _hideNavBar,
                    decoration: NavBarDecoration(
                      colorBehindNavBar: Colors.indigo,
                    ),
                    popAllScreensOnTapOfSelectedTab: true,
                    itemAnimationProperties: ItemAnimationProperties(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease,
                    ),
                    screenTransitionAnimation: ScreenTransitionAnimation(
                      animateTabTransition: true,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 200),
                    ),
                    navBarStyle: NavBarStyle.style12,
                  ),
                ),
              ),
            )
          : Container();
    });
    //);
    //  : NoInternetscreen();
    // });
  }
}
