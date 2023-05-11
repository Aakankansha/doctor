import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  Future getPrivacyPolicy() async {
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://clearviklap.digitalnaman.com/api/index.php/Auth/privacy_policy_fetch'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
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
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getPrivacyPolicy(),
          builder: (context, snap) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //about us
                    '''
                  
                    This Privacy Policy describes how your personal information is collected, used, and shared when you visit or make a purchase from www.abc.com (the “Site”).
               
'''
                        .text
                        .make(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
