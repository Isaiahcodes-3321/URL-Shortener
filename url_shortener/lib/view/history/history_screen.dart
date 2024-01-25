import '../export.dart';



class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool showShimmer = true;

  @override
  void initState() {
    super.initState();
    openHIve();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showShimmer = false;
        });
      }
    });
  }

  openHIve() async {
    GlobalControllers.linkStorage =
        await Hive.openBox<LinkStorage>('storageBox');
  }

  @override
  Widget build(BuildContext context) {
    final getListOfLink = Hive.box<LinkStorage>('storageBox');

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.hBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.drawerBackgroundIconColor,
          elevation: 9.sp,
          shadowColor: AppColors.mainColor,
          leading: IconButton(
            color: AppColors.hTextColor,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => HomeScreen(),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('History',
                  style: AppTextStyling.fontStyling()
                      .copyWith(fontSize: 20.sp, color: AppColors.hTextColor)),
              GestureDetector(
                onTap: () {
                  getListOfLink.clear();
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => HistoryPage(),
                    ),
                  );
                },
                child: Text('Empty',
                    style: AppTextStyling.fontStyling()
                        .copyWith(fontSize: 19.sp, color: AppColors.hTextColor)),
              ),
            ],
          ),
        ),
        body: SizedBox(
            width: double.infinity,
            height: 100.h,
            child: showShimmer
                ? ListView.builder(
                    itemCount: getListOfLink.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 13.h,
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.rtl,
                            baseColor: const Color.fromARGB(255, 214, 214, 215),
                            highlightColor:
                                const Color.fromARGB(255, 239, 239, 241),
                            enabled: true,
                            child: const Card(
                              child: ListTile(),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: getListOfLink.length,
                    itemBuilder: (context, index) {
                      final getListAtIndex =
                          getListOfLink.getAt(index) as LinkStorage;
      
                      return Padding(
                        padding: EdgeInsets.all(13.sp),
                        child: Container(
                          height: 13.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.hTextColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(getListAtIndex.shortLink,
                                            softWrap: true,
                                            style: AppTextStyling.fontStyling()
                                                .copyWith(
                                                    fontSize: 17.sp,
                                                    color: AppColors.hTextColor)),
                                        Text(getListAtIndex.description,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyling.fontStyling()
                                                .copyWith(
                                                    fontSize: 16.sp,
                                                    color: AppColors.hTextColor)),
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        FlutterClipboard.copy(
                                                getListAtIndex.shortLink)
                                            .then((result) {
                                          const snackBar = SnackBar(
                                            content:
                                                Text('Link copied to clipboard'),
                                            duration: Duration(seconds: 2),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        });
                                      },
                                      child: Icon(Icons.copy_outlined,
                                          color: AppColors.hTextColor,
                                          size: 24.sp),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
