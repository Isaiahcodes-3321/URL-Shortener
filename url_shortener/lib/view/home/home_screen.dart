import '../export.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int historyFontSize = 15;
    return SafeArea(
      child: Consumer(builder: (context, ref, _) {
        GlobalControllers.poviderRef = ref;
        var checkTheme = ref.watch(ProviderClass.themeMode);
        return Scaffold(
          backgroundColor: AppColors.mainColor,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  const HomeBody(),
                  Positioned(
                      top: 10.h,
                      right: 0,
                      child: ref.watch(ProviderClass.isMenuClick) == false
                          ? Container(
                              width: 15.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                color: AppColors.drawerColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.sp),
                                  bottomLeft: Radius.circular(20.sp),
                                ),
                                border: Border.all(
                                  color: AppColors.mainColor,
                                  width: 2,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                          .read(ProviderClass.isMenuClick.notifier)
                                          .state =
                                      !ref.read(ProviderClass.isMenuClick);
                                },
                                child: Icon(
                                  Icons.menu_open,
                                  size: 25.sp,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            )
                          : const SizedBox()),
                  Positioned(
                    top: 0.h,
                    right: 0,
                    // side bar
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: ref.watch(ProviderClass.isMenuClick) == true
                          ? 16.w
                          : 0,
                      height: 100.h,
                      color: AppColors.drawerColor,
                      child: ref.watch(ProviderClass.isMenuClick) == true
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                          .read(ProviderClass.isMenuClick.notifier)
                                          .state =
                                      !ref.read(ProviderClass.isMenuClick);
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Icon(
                                      Icons.cancel_outlined,
                                      size: 30.sp,
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(
                                      height: 33.h,
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HistoryPage(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                                width: 10.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: AppColors.mainColor,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(15.sp),
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 7,
                                                    itemBuilder:
                                                        (context, index) {
                                                      String history = 'H';
                                                      switch (index) {
                                                        case 0:
                                                          history = 'H';
                                                          break;
                                                        case 1:
                                                          history = 'i';
                                                          break;
                                                        case 2:
                                                          history = 's';
                                                          break;
                                                        case 3:
                                                          history = 't';
                                                          break;
                                                        case 4:
                                                          history = 'o';
                                                          break;
                                                        case 5:
                                                          history = 'r';
                                                          break;
                                                        case 6:
                                                          history = 'y';
                                                          break;
                                                        default:
                                                          print(
                                                              'Unknown index');
                                                      }
                                                      return Center(
                                                        child: Text(
                                                          history,
                                                          style: AppTextStyling
                                                                  .fontStyling()
                                                              .copyWith(
                                                            fontSize:
                                                                historyFontSize
                                                                    .sp,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )),
                                          ),
                                          CupertinoSwitch(
                                            activeColor: Colors.white,
                                            thumbColor: Colors.green,
                                            trackColor: const Color.fromARGB(
                                                255, 35, 35, 36),
                                            value: checkTheme,
                                            onChanged: (value) async {
                                              setState(() {
                                                ref
                                                    .read(ProviderClass
                                                        .themeMode.notifier)
                                                    .state = value;
                                                AppColors.changeColor();
                                                print('valuse its $checkTheme');
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const Text(''),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

