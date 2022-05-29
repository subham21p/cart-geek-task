// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty, library_prefixes

import 'dart:developer';
import 'dart:io';

import 'package:cart_greek/services/apiservice/homeApiService.dart';
import 'package:flutter/material.dart';

class FutureDataProvider with ChangeNotifier {
  var homeData;
  bool appbarVisibility = true;
  FutureDataProvider() {
    getHomeData();
  }

  Future getHomeData() async {
    homeData = HomeApiService.getHomeData();

    notifyListeners();
    return homeData;
  }

  appbarVisible() {
    appbarVisibility = true;
    notifyListeners();
  }

  appBarInvisible() {
    appbarVisibility = false;
    notifyListeners();
  }
}
