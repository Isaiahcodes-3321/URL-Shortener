import 'package:url_shortener/view/export.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// ignore_for_file: use_build_context_synchronously

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
    String description = GlobalControllers.description.text;

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

// check if user network is connected before calling the api
  static startInternetCheck(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.mainColor,
          content: Text("Internet connection is needed.",
              style: AppTextStyling.fontStyling().copyWith(
                  fontSize: 18.sp, color: AppColors.drawerBackgroundIconColor)),
          duration: const Duration(seconds: 4),
        ),
      );
    } else {
      ApiCalling.postLongLink(context);
    }
  }
}
