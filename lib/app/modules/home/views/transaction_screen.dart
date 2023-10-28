import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});
  getTransactionList() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Transaction/transaction_fetch'));
    request.fields.addAll({'user_id': '1'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return jsonDecode(res)["transaction_details"];
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          'My Transactions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getTransactionList(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            log(snap.data.toString());
            var listOfTransaction = snap.data as List<dynamic>;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        "Transactions".text.bold.xl2.make(),
                        const Spacer(),
                        "filter"
                            .text
                            .white
                            .bold
                            .make()
                            .pSymmetric(
                              h: 20,
                              v: 5,
                            )
                            .box
                            .black
                            .withRounded(value: 8)
                            .make(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ...listOfTransaction
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              // title: "Bank Reference ID: 123456789"
                              //     .text
                              //     .white
                              //     .size(12)
                              //     .make(),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  e["created_at"]
                                      .toString()
                                      .text
                                      .white
                                      .size(12)
                                      .make(),
                                  e["service_name"]
                                      .toString()
                                      .text
                                      .white
                                      .size(16)
                                      .make(),
                                  // "Health Checkup".text.white.size(12).make(),
                                ],
                              ),
                              trailing: "- ${e["amount"]} "
                                  .toString()
                                  .text
                                  .xl2
                                  .red500
                                  .bold
                                  .make(),
                            ).p8().box.withRounded().color(themeColor).make(),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
