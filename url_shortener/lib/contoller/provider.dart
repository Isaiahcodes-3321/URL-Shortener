import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderClass {
  static final isMenuClick = StateProvider((ref) => false);
  static final getShortLink = StateProvider((ref) => '');
  // static final getDescription = StateProvider((ref) => '');

  static final isLoading = StateProvider((ref) => false);
  static final isShowingShortLink = StateProvider((ref) => false);
}
