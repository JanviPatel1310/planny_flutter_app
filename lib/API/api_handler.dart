import 'package:http/http.dart' as http;

enum ApiType {
  Get,
  Post,
  Put,
  Patch,
  Delete,
}

class API {
  static http.Response response;

  static Future apiHandler({
    String url,
    ApiType apiType,
    Domain,
    AuthToken,
    Map<String, dynamic> body,
  }) async {
    try {
      if (apiType == ApiType.Get) {
        response = await http.get(
          Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'domain': Domain,
            'Authorization': AuthToken,
          },
        );
      } else if (apiType == ApiType.Post) {
        response = await http.post(Uri.parse(url), body: body);
      }

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
