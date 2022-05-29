import 'package:cart_greek/utils/colors/colors.dart';
import 'package:cart_greek/utils/size_config.dart';
import 'package:cart_greek/widgets/textWidget/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatefulWidget {
  final bool? appBarVisible;
  const EmptyScreen({Key? key, this.appBarVisible}) : super(key: key);

  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  // Map _source = {ConnectivityResult.none: false};
  String? string;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
          appBar: widget.appBarVisible != null && widget.appBarVisible == true
              ? AppBar(
                  elevation: 0,
                  backgroundColor: whiteColor,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: iconColorBlack,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              : null,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Stack(children: [
                // Padding(
                //   padding: EdgeInsets.only(top: SizeConfig.fullHeight! * 0.1),
                //   child: SizedBox(
                //     height: SizeConfig.fullHeight! * 0.5,
                //     width: SizeConfig.fullWidth,
                //     child: SvgPicture.asset(
                //       "images/svg/no_data.svg",
                //       //color: Colors.grey,
                //     ),
                //   ),
                // ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: SizeConfig.fullHeight! * 0.6),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          TextWidget(
                            color: textColorBlack,
                            fontWeight: FontWeight.w800,
                            text: 'No data Available',
                            textSize: 22.0,
                            maxline: 2,
                            align: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextWidget(
                            color: textColorGrey,
                            fontWeight: FontWeight.w800,
                            text: 'There is no data to show you right now',
                            textSize: 18.0,
                            maxline: 2,
                            align: TextAlign.center,
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
          )),
    );
  }
}
