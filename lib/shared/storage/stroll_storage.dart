import 'package:hive/hive.dart';
import 'package:stroll_test/dependency_injection.dart';
import 'package:logger/logger.dart';

const favoriteStorageKey = 'favorite-storage-options';
const cardStorageKey = 'card-storage-options';

class StrollStorage {
  static saveData<T>(String key, T data) {
    Hive.box().put(key, data);
  }

  static T? getData<T>(String key) {
    var data = Hive.box().get(key);
    Logger().d("hive data: $data");
    if (data is List<dynamic>) {
      Logger().d("hive data map: ${data.runtimeType}");
    }
    return data as T?;
  }
}
