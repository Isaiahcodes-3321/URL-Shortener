import 'package:flutter/material.dart';
import 'package:url_shortener/view/export.dart';
import 'package:url_shortener/contoller/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  top: 10.h,
                  right: 0,
                  child: ref.watch(ProviderClass.isMenuClick) == false
                      ? Container(
                          width: 15.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: AppColors.drawerBackgroundIconColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.sp),
                              bottomLeft: Radius.circular(20.sp),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(ProviderClass.isMenuClick.notifier)
                                  .state = !ref.read(ProviderClass.isMenuClick);
                            },
                            child: Icon(
                              Icons.menu_open,
                              size: 25.sp,
                              color: Colors.green,
                            ),
                          ),
                        )
                      : SizedBox()),
              Positioned(
                top: 0.h,
                left: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  width:
                      ref.watch(ProviderClass.isMenuClick) == true ? 15.w : 0,
                  height: 100.h,
                  color: Colors.red,
                  child: ref.watch(ProviderClass.isMenuClick) == true
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(ProviderClass.isMenuClick.notifier)
                                  .state = !ref.read(ProviderClass.isMenuClick);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Icon(
                                  Icons.cancel_outlined,
                                  size: 27.sp,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Text(''),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}












































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
