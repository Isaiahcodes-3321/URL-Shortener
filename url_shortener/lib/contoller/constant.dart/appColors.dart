import 'dart:ui';
import '../../view/export.dart';
// ignore_for_file: prefer_const_constructors


class AppColors {
  static Color mainColor = Color.fromARGB(255, 13, 13, 14);
  static Color drawerColor = Color.fromARGB(255, 231, 231, 237);
  static Color drawerBackgroundIconColor = Color.fromARGB(255, 255, 255, 255);

  // history Colors
  static Color hTextColor = Color.fromARGB(255, 13, 13, 14);
  static Color hBackgroundColor = Color.fromARGB(255, 254, 254, 255);

  static changeColor() {
    hTextColor = GlobalControllers.poviderRef.watch(ProviderClass.themeMode)
        ? Color.fromARGB(255, 254, 254, 255)
        : Color.fromARGB(255, 13, 13, 14);

    hBackgroundColor =
        GlobalControllers.poviderRef.watch(ProviderClass.themeMode)
            ? Color.fromARGB(255, 13, 13, 14)
            : Color.fromARGB(255, 254, 254, 255);

    drawerBackgroundIconColor =
        GlobalControllers.poviderRef.watch(ProviderClass.themeMode)
            ? Color.fromARGB(255, 18, 18, 18)
            : Color.fromARGB(255, 255, 255, 255);

    mainColor = GlobalControllers.poviderRef.watch(ProviderClass.themeMode)
        ? Color.fromARGB(255, 255, 255, 255)
        : Color.fromARGB(255, 13, 13, 14);

    drawerColor = GlobalControllers.poviderRef.watch(ProviderClass.themeMode)
        ? Color.fromARGB(255, 13, 13, 14)
        : Color.fromARGB(255, 231, 231, 237);
  }
}
