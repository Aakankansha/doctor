import 'package:get_storage/get_storage.dart';

class SharedMemory {
  final box = GetStorage();

  setToken(String token) {
    box.write("token", token);
  }

  String getToken() {
    if (box.read("token") == null) {
      return "";
    }
    return box.read("token");
  }
}
