import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_url_shortener/bitly.dart';
import 'package:url_shortener/model/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_shortener/view/home/home_screen.dart';
import 'package:url_shortener/contoller/globalControls/contolls.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LinkStorageAdapter());
   FShort.instance.setup(token: 'a5xxx7a59eb1115b2dfdd3f0caa76d8cc592257d');
  GlobalControllers.linkStorage = await Hive.openBox<LinkStorage>('storageBox');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
