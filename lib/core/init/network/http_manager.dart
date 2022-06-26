import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpManager {
  static HttpManager? _instance;
  static HttpManager get instance {
    _instance ??= HttpManager._init();
    return _instance!;
  }

  HttpManager._init();

  getJsonRequest(String urlPath) async {
    String uri = urlPath;
    try {
      http.Response res = await http.get(Uri.parse(uri));
      var body = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return {'status': true, 'data': body};
      } else {
        return {'status': false, 'message': body};
      }
    } on HttpException catch (e) {
      return {'status': false, 'message': e.message};
    }
  }
}
