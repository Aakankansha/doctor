import 'package:get_storage/get_storage.dart';

class SharedMemory {
  final box = GetStorage();

  setUserId(String token) {
    box.write("user_id", token);
  }

  String getUserId() {
    if (box.read("user_id") == null) {
      return "1";
    }
    return box.read("user_id") ?? "1";
  }
}
