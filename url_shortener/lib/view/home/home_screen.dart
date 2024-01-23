import '../export.dart';
import '../../contoller/globalControls/contolls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      GlobalControllers.poviderRef = ref;
      return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              HomeBody(),
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
                              color: Colors.black,
                              width: 2,
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
                              color: Colors.black,
                            ),
                          ),
                        )
                      : SizedBox()),
              Positioned(
                top: 0.h,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  width:
                      ref.watch(ProviderClass.isMenuClick) == true ? 16.w : 0,
                  height: 100.h,
                  color: Colors.white,
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
                                  size: 30.sp,
                                  color: Colors.black,
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
