import 'package:clear_vikalp_app/app/modules/subscription/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetPremiumScreen extends StatelessWidget {
  const GetPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SubscriptionController c = Get.put(SubscriptionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clear Vikalp Premium'),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/diamond.png",
                  height: 150,
                ),
                const Text(
                  'Upgrade to Premium',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 40),
                //   child: Text(
                //     'Unlock exciting premium features and enjoy an ad-free experience!',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 18,
                //       color: Colors.grey[700],
                //     ),
                //   ),
                // ),
                if (c.subscriptionList.isNotEmpty)
                  ...c.currentSelectedSubscription.value.description!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    e.info1 ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Plans",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: c.subscriptionList.length,
                      itemBuilder: (context, index) => Obx(
                        () => SizedBox(
                          width: Get.width * 0.45,
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedback.lightImpact();
                              c.currentSelectedSubscription.value =
                                  c.subscriptionList[index];
                            },
                            child: Card(
                              color: c.currentSelectedSubscription.value.sId ==
                                      c.subscriptionList[index].sId
                                  ? Colors.green.shade500
                                  : Colors.white,
                              elevation:
                                  c.currentSelectedSubscription.value.sId ==
                                          c.subscriptionList[index].sId
                                      ? 4
                                      : 1,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: c.currentSelectedSubscription.value
                                            .sId !=
                                        c.subscriptionList[index].sId
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green.shade100,
                                        )),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(
                                      //               8),
                                      //       color: Colors.blue.shade100
                                      //           .withOpacity(0.5)),
                                      //   child: Padding(
                                      //     padding:
                                      //         const EdgeInsets.all(8.0),
                                      //     child: Icon(
                                      //       Icons.workspace_premium,
                                      //       size: 25,
                                      //       color: Colors.blue.shade500,
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        c.subscriptionList[index].title ?? "",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: c.currentSelectedSubscription
                                                      .value.sId ==
                                                  c.subscriptionList[index].sId
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 14.0),
                                            child: Text(
                                              "₹",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    c.currentSelectedSubscription
                                                                .value.sId ==
                                                            c
                                                                .subscriptionList[
                                                                    index]
                                                                .sId
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            c.subscriptionList[index].amount
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 32,
                                              color:
                                                  c.currentSelectedSubscription
                                                              .value.sId ==
                                                          c
                                                              .subscriptionList[
                                                                  index]
                                                              .sId
                                                      ? Colors.white
                                                      : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 14.0),
                                            child: Text(
                                              "/${c.subscriptionList[index].validity}",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    c.currentSelectedSubscription
                                                                .value.sId ==
                                                            c
                                                                .subscriptionList[
                                                                    index]
                                                                .sId
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (c.currentSelectedSubscription.value.requestStatus != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Request Status: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          elevation: 1,
                          color: c.currentSelectedSubscription.value
                                      .requestStatus ==
                                  "pending"
                              ? Colors.blue.shade500
                              : c.currentSelectedSubscription.value
                                          .requestStatus ==
                                      "approved"
                                  ? Colors.green.shade500
                                  : Colors.red.shade400,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Text(
                                c.currentSelectedSubscription.value
                                    .requestStatus!
                                    .toString()
                                    .capitalizeFirst
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 55),
                        backgroundColor: Colors.green.shade500,
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                      },
                      child: const Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 5),
                // TextButton(
                //   onPressed: () {
                //     Get.back();
                //   },
                //   child: Text(
                //     'Maybe Later',
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: getPrimaryColor(context: context)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
