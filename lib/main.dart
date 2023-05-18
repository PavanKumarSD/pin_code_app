import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Pages/LoginPage.dart';
import 'Pages/homePage.dart';

void main() {
  runApp(PinCodeApp());
}

class PinCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pin Code App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

