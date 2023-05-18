import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'homePage.dart';

class AuthPage extends StatefulWidget {
  final String pinCode;

  AuthPage({required this.pinCode});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your PIN to authenticate',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) {
                // Handle pin code changes
              },
              onCompleted: (value) {
                setState(() {
                  // Verify the entered pin code
                  isAuthenticated = value == widget.pinCode;
                });
                if (isAuthenticated) {
                  // Navigate to the home screen if the pin code is correct
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  // Display an error message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Invalid PIN. Please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
