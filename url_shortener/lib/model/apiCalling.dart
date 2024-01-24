import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_shortener/view/export.dart';

class ApiCalling {
  static Future<void> postLongLink(BuildContext context) async {
    // change the state of loading to true
    GlobalControllers.poviderRef.read(ProviderClass.isLoading.notifier).state =
        true;
    print('calling endpoint now ');
    var urlEndpoint = Uri.https('url-shortener-yh27.onrender.com', '');

    var response = await http.post(urlEndpoint,
        body: {'long_url': GlobalControllers.longLinkURL.text});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String shortUrl = data['data']['short_url'];
      print('successful Response body: $shortUrl');
      print('successful successful Response body: ${response.body}');
      // change the state of loading to false after the link have been shorten
      GlobalControllers.poviderRef
          .read(ProviderClass.isLoading.notifier)
          .state = false;
      GlobalControllers.poviderRef
          .read(ProviderClass.isShowingShortLink.notifier)
          .state = true;
      GlobalControllers.poviderRef
          .read(ProviderClass.getShortLink.notifier)
          .state = shortUrl;

    } else {
      print('error Response body: ${response.body}');
    }
  }
}
