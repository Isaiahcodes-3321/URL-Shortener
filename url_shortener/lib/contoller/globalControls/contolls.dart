import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener/model/storage.dart';

class GlobalControllers {
  static TextEditingController longLinkURL = TextEditingController();
  static TextEditingController description = TextEditingController();
  static var poviderRef;
  static late Box<LinkStorage> linkStorage;
}
