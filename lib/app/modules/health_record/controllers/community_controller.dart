import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';
import '../model/communities_model.dart';
import '../model/messages_model.dart';

class HealthRecordController extends GetxController {
  var isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  CommunitesModel? communitesModel;
  CommunityMessagesModel? communityMessagesModel;
  Future addMessage({String? message, String? communityId}) async {
    try {
      log("Loading...");
      String pageUrl = "api/messages/community/$communityId";
      final header = {
        "Authorization": "Bearer $token",
      };
      final body = {
        "message": "$message",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
        body: body,
      );
      if (response.statusCode == 200) {
        log("message: " + response.body);
      } else {
        log(response.body);
        Get.snackbar("Error", response.body);
      }
    } on Exception catch (e) {
      log("$e");
    } catch (e) {
      log("$e");
    }
  }

  Future<CommunitesModel?> getCommunities() async {
    try {
      log("Loading...");
      const String pageUrl = "api/community";
      final header = {
        "Authorization": "Bearer $token",
      };
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode == 200) {
        log("communities: " + response.body);
        communitesModel = CommunitesModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
        Get.snackbar("Error", response.body);
      }
    } on Exception catch (e) {
      log("$e");
    } catch (e) {
      log("$e");
    }
    return communitesModel;
  }

  Future<CommunityMessagesModel?> getCommunityMessages() async {
    try {
      log("Loading...");
      const String pageUrl = "api/messages/community/6322f723d3f59f76c7f8eef6";
      final header = {
        "Authorization": "Bearer $token",
      };
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode == 200) {
        log("Messages: " + response.body);
        communityMessagesModel =
            CommunityMessagesModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    } catch (e) {
      log("$e");
    }
    return communityMessagesModel;
  }
}
