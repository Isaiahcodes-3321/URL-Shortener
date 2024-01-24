import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_shortener/view/export.dart';
import 'package:url_shortener/model/storage.dart';

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
    Future.delayed(Duration(seconds: 5), () {
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
    final getListOfLink = Hive.box<LinkStorage>('storageBox');
    print('my opopopop ${getListOfLink.getAt(0)?.shortLink}');
  }

  @override
  Widget build(BuildContext context) {
    final getListOfLink = Hive.box<LinkStorage>('storageBox');

    return Scaffold(
      appBar: AppBar(
        elevation: 9.sp,
        shadowColor: Colors.black,
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
                          baseColor: Color.fromARGB(255, 214, 214, 215),
                          highlightColor: Color.fromARGB(255, 239, 239, 241),
                          enabled: true,
                          child: Card(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(13.sp),
                          child: Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Expanded( flex: 8,
                                  child: Container(
                                    color:  Colors.red,
                                    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getListAtIndex.shortLink,
                                          // softWrap: true,
                                        ),
                                        Text(
                                          getListAtIndex.description,
                                          softWrap: true,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
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
                                        color: AppColors.mainColor, size: 24.sp),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
    );
  }
}










  // Column(
  //                                 children: [
  //                                   Expanded(
  //                                     child: Text(
  //                                       getListAtIndex.shortLink,
  //                                       softWrap: true,
  //                                     ),
  //                                   ),
  //                                   Expanded(
  //                                     child: Text(
  //                                       getListAtIndex.description,
  //                                       softWrap: true,
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
 