import 'package:url_shortener/view/export.dart';

class ScreenControl {
  static copyToClipboard(
    BuildContext context,
  ) {
    var displayShortLink =
        GlobalControllers.poviderRef.watch(ProviderClass.getShortLink);
    FlutterClipboard.copy(displayShortLink).then((result) {
      const snackBar = SnackBar(
        content: Text('Link copied to clipboard'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  static saveLinkAndDescription(BuildContext context) async {
    GlobalControllers.linkStorage =
        await Hive.openBox<LinkStorage>('storageBox');
    // update short link and description to provider
    String description =  GlobalControllers.description.text;

    var saveShortLink =
        GlobalControllers.poviderRef.watch(ProviderClass.getShortLink);
    var history =
        LinkStorage(shortLink: saveShortLink, description: description);
    GlobalControllers.linkStorage.add(history);
    GlobalControllers.description.clear();

    const snackBar = SnackBar(
      content: Text('Link and description saved'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
}
