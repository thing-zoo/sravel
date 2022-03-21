import 'dart:convert';
import "package:http/http.dart" as http;


//다른 버전인디,,, 일단 보류
class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, String> cookies = {};

  Future<dynamic> get(String url) async {
    print('get() url: $url');

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      //코드 입력
    }
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<dynamic> post(String url, dynamic data) async {
    print('post() url: $url');
    http.Response response = await http.post(Uri.parse(url),
        body: json.encode(data), headers: headers);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      //코드 입력
    }
    return json.decode(utf8.decode(response.bodyBytes));
  }
}
