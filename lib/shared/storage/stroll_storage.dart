import 'package:hive/hive.dart';
import 'package:stroll_test/dependency_injection.dart';

const favoriteStorageKey = 'favorite-storage-options';
const cardStorageKey = 'card-storage-options';

class StrollStorage {
  static saveData<T>(String key,T data) {
    getIt<Box>().put(key, options);
  }

  static T? getData<T>(String key) {
    return getIt<Box>().get(key) as T?;
  }
}
