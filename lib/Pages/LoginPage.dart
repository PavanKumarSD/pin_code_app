import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'AuthPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Onion Web'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create Your P I N code' ,style: TextStyle(fontSize: 25), ),

            PinCodeTextField(
              controller: pinController,
              appContext: context,
              length: 4,
              onChanged: (value) {
                // Handle pin code changes
              },
              onCompleted: (value) {
                // Store the pin code for authentication
                // You can save it to a local database or shared preferences
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the authentication screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthPage(pinCode: pinController.text),
                  ),
                );
              },
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
