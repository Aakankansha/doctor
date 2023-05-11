import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  Future getAbout() async {
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
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getAbout(),
          builder: (context, snap) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //about us
                    '''
                    We are a team of doctors, engineers and designers who are passionate about healthcare and believe that technology can help improve access to healthcare. We are backed by some of the most reputed investors in India and the world.

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
