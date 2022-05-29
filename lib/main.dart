// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:cart_greek/provider/connectivityProvider/connectivity_provider.dart';
import 'package:cart_greek/provider/futuredataProvider/futureDataProvider.dart';
import 'package:cart_greek/utils/size_config.dart';
import 'package:cart_greek/widgets/bottomnavigationbar/bottom_navigationBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => FutureDataProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ConnectivityProvider(),
    ),
  ], child: const MyApp()));
}

final ScrollController scrollController = ScrollController();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dividend Desk',
      // theme: primaryColors,
      home: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return BottomNavBar(
              schedulerBinding: true,
            );
          },
        );
      }),
      //  onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
