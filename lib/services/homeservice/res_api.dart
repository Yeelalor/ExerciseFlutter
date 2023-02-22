import 'package:dio/dio.dart';
import 'package:flutterwidgets/config/dio_connect_api.dart';

class CallAPI {
  Future getDataTest() async {
    try {
      Response res = await dio.get('/comments');
      if (res.data != null) {
        return res.data;
      } else {
        return [];
      }
    } catch (error) {
      logger.e(error);
    }
  }
}
