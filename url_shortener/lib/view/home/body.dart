import '../export.dart';
import 'package:url_shortener/model/apiCalling.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_shortener/contoller/globalControls/contolls.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return AnimatedContainer(
        color: AppColors.drawerBackgroundIconColor,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: ref.watch(ProviderClass.isMenuClick) == false ? 100.w : 83.w,
        height: 100.h,
        child: Column(children: [
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'SI',
                      style: AppTextStyling.fontStyling()
                          .copyWith(fontSize: 30.sp),
                    ),
                    const SizedBox(width: 20.0, height: 100.0),
                    DefaultTextStyle(
                      style: AppTextStyling.fontStyling()
                          .copyWith(fontSize: 30.sp),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText('URL',
                              textStyle: AppTextStyling.fontStyling()
                                  .copyWith(fontSize: 30.sp)),
                          RotateAnimatedText('SHORTENER',
                              textStyle: AppTextStyling.fontStyling()
                                  .copyWith(fontSize: 30.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
                  // color: Colors.red,
                  child: InputURL()))
        ]),
      );
    });
  }
}

class InputURL extends StatefulWidget {
  const InputURL({Key? key}) : super(key: key);

  @override
  State<InputURL> createState() => _InputURLState();
}

class _InputURLState extends State<InputURL> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var displayShortLink = ref.watch(ProviderClass.getShortLink);
      return Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: GlobalControllers.longLinkURL,
                decoration: InputDecoration(
                  hintText: 'Url link',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.mainColor),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.mainColor),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.short_text_rounded,
                        color: AppColors.mainColor, size: 26.sp),
                    onPressed: () {
                      ApiCalling.postLongLink(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(child: Text(displayShortLink))
            ],
          ),
        ),
      );
    });
  }
}







  // Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   'ywfvdhywgvdyhvwydhwvdjwh',
  //                   softWrap: true,
  //                 ),
  //               ),
  //               Icon(Icons.copy_outlined,
  //                   color: AppColors.mainColor, size: 24.sp),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 2.h,
  //           ),
  //           TextField(
  //             autofocus: true,
  //             decoration: InputDecoration(
  //               hintText: 'Add Description',
  //               hintStyle: const TextStyle(
  //                 color: Colors.grey,
  //               ),
  //               focusedBorder: UnderlineInputBorder(
  //                 borderSide: BorderSide(color: AppColors.mainColor),
  //               ),
  //               enabledBorder: UnderlineInputBorder(
  //                 borderSide: BorderSide(color: AppColors.mainColor),
  //               ),
  //               suffixIcon: IconButton(
  //                 icon: Icon(Icons.short_text_rounded,
  //                     color: AppColors.mainColor, size: 26.sp),
  //                 onPressed: () {},
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 15.h,),
  //           Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20.sp),
  //               color: Colors.black,
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.only(left: 20.w, right: 20.w),
  //               child: MaterialButton(
  //                 onPressed: () {},
  //                 child: Text('Save', style:  AppTextStyling.fontStyling()
  //                                   .copyWith(fontSize: 20.sp, color: Colors.white)),
  //               ),
  //             ),
  //           ),













// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String textToCopy = "Hello, Clipboard!";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Clipboard Example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               textToCopy,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             IconButton(
//               icon: Icon(Icons.content_copy),
//               onPressed: () {
//                 _copyToClipboard(context, textToCopy);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _copyToClipboard(BuildContext context, String text) {
//     FlutterClipboard.copy(text).then((result) {
//       final snackBar = SnackBar(
//         content: Text('Text copied to clipboard'),
//         duration: Duration(seconds: 2),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     });
//   }
// }
