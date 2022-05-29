import 'package:cart_greek/services/baseApi/api_base.dart';
import 'package:cart_greek/services/baseApi/api_url.dart';

class HomeApiService {
  static Future getHomeData() async {
    var response = await ApiBase.getRequest(extendedURL: ApiUrl.homeApi);
    if (response.statusCode != 200) {
      throw "Error While Retrieving Data API";
    }
    return response.body;
  }
}
