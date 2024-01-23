import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_shortener/view/export.dart';
import 'package:url_shortener/contoller/globalControls/contolls.dart';

class ApiCalling {
  static Future<void> postLongLink(BuildContext context) async {
    print('calling endpoint now ');
    var urlEndpoint = Uri.https('url-shortener-yh27.onrender.com', '');

    var response = await http.post(urlEndpoint,
        body: {'long_url': GlobalControllers.longLinkURL.text});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String shortUrl = data['data']['short_url'];
      print('succesfull Response body: $shortUrl');
      print('succesfull succesfull Response body: ${response.body}');
      GlobalControllers.poviderRef
          .read(ProviderClass.getShortLink.notifier)
          .state = shortUrl;
    } else {
      print('error Response body: ${response.body}');
    }
  }
}
