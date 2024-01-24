import 'package:hive/hive.dart';
part 'storage.g.dart';

// Storage for user

@HiveType(typeId: 1)
class LinkStorage {
  LinkStorage({
    required this.shortLink,
    required this.description,
  });

  @HiveField(0)
  String shortLink;

  @HiveField(1)
  String description;
}


// flutter packages pub run build_runner build
