import '../export.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var displayShortLink = ref.watch(ProviderClass.getShortLink);
    
      return AnimatedContainer(
        color: AppColors.drawerBackgroundIconColor,
        duration: const Duration(milliseconds: 200),
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
              child: SizedBox(
                  // color: Colors.red,
                  child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: GlobalControllers.longLinkURL,
                        style: TextStyle(color: AppColors.mainColor),
                        decoration: InputDecoration(
                          hintText: 'Url link',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.mainColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.mainColor),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.short_text_rounded,
                                color: AppColors.mainColor, size: 26.sp),
                            onPressed: () {
                              ScreenControl.startInternetCheck(context);
    
                              GlobalControllers.poviderRef
                                  .read(ProviderClass
                                      .isShowingShortLink.notifier)
                                  .state = false;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                          child: Column(
                        children: [
                          ref.watch(ProviderClass.isLoading)
                              ? SpinKitThreeInOut(
                                  color:
                                      const Color.fromARGB(255, 66, 167, 70),
                                  size: 25.sp,
                                )
                              : SizedBox(),
                          ref.watch(ProviderClass.isShowingShortLink)
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            displayShortLink,
                                            softWrap: true,
                                            style: TextStyle(
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>
                                              ScreenControl.copyToClipboard(
                                                  context),
                                          child: Icon(Icons.copy_outlined,
                                              color: AppColors.mainColor,
                                              size: 24.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    TextField(
                                      controller:
                                          GlobalControllers.description,
                                      style: TextStyle(
                                          color: AppColors.mainColor),
                                      decoration: InputDecoration(
                                        hintText: 'Add Description',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                        color: AppColors.mainColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w, right: 20.w),
                                        child: MaterialButton(
                                          onPressed: () async {
                                            ScreenControl
                                                .saveLinkAndDescription(
                                                    context);
                                            Future.delayed(
                                                const Duration(seconds: 3),
                                                () async {
                                              ref
                                                  .read(ProviderClass
                                                      .isLoading.notifier)
                                                  .state = false;
                                              ref
                                                  .read(ProviderClass
                                                      .isShowingShortLink
                                                      .notifier)
                                                  .state = false;
                                              GlobalControllers.longLinkURL
                                                  .clear();
                                            });
                                          },
                                          child: Text('Save',
                                              style: AppTextStyling
                                                      .fontStyling()
                                                  .copyWith(
                                                      fontSize: 20.sp,
                                                      color: AppColors
                                                          .drawerBackgroundIconColor)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ))
                    ],
                  ),
                ),
              )))
        ]),
      );
    });
  }
}
