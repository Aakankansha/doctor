import 'package:flutter/material.dart';

import '../../../core/resources/app_resources.dart';

class RefundStatusScreen extends StatelessWidget {
  const RefundStatusScreen({super.key});

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
          'Refund Status',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return  Card(
              child: ListTile(
                title: Text('Order ID: 123456789',style: TextStyle(color: Colors.blue[900],fontSize: 15,),),
                subtitle: Text('Refund ID: 123456789'),
                trailing: Text('Refund Status: Success',style: TextStyle(color: Colors.green),),
              ),
            );
          },
        ),
      ),
    );
  }
}
