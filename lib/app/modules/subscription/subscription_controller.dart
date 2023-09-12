import 'package:clear_vikalp_app/app/modules/subscription/subscription_model.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  var subscriptionList = <SubscriptionModel>[].obs;
  var isLoading = true.obs;
  var isRequestPlanLoading = false.obs;
  var currentSelectedSubscription = SubscriptionModel().obs;
  var json = [
    {
      "_id": "64d4ce3bc9248b7a79455a55",
      "title": "For individual",
      "validity": "yearly",
      "amount": 3499,
      "type": "unlimited",
      "description": [
        {"info1": "Only one person added", "info2": ""},
        {"info1": "Additional cash back on each transaction", "info2": ""},
        {"info1": "Free pick & Drop from hospital", "info2": ""},
        {"info1": "One room upgradation during hospital stay", "info2": ""},
        {"info1": "Free one OPD Consultation Post Hospital stay", "info2": ""},
      ],
      "isActive": false,
      "requestStatus": null
    },
    {
      "_id": "64d4ce3bc9248b7a79455a53",
      "title": "For Family",
      "validity": "yearly",
      "amount": 6499,
      "type": "free",
      "description": [
        {"info1": "Can add 4 family members including self", "info2": ""},
        {"info1": "Additional cash back on each transaction", "info2": ""},
        {
          "info1": "Assistance during admission at partner hospital",
          "info2": ""
        },
        {"info1": "Free pick & Drop from hospital", "info2": ""},
        {"info1": "One room upgradation during hospital stay", "info2": ""},
        {"info1": "Free one OPD Consultation Post Hospital stay", "info2": ""},
      ],
      "isActive": false,
      "requestStatus": null
    }
  ];

  getSubscriptionList() {
    subscriptionList.value =
        json.map((e) => SubscriptionModel.fromJson(e)).toList();
    currentSelectedSubscription.value = subscriptionList[0];
    isLoading.value = false;
  }

  @override
  void onReady() {
    getSubscriptionList();
    super.onReady();
  }
}
