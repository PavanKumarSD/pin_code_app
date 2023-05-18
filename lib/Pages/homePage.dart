import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.mfapi.in/mf/119063'));
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final data = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data from API:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Scheme Name: ${data['meta']['scheme_name']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Scheme ID: ${data['meta']['scheme_code']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          // Table(
                          //     border: TableBorder.all(), // Allows to add a border decoration around your table
                          //     children: [
                          //       TableRow(children :[
                          //         Text('Date'),
                          //         Text("${data['data'][index]['date']}"),
                          //
                          //       ]),
                          //       TableRow(children :[
                          //         Text('Nav',),
                          //         Text("${data['data'][index]['nav']}"),
                          //
                          //       ]),
                          //
                          //     ]
                          // ),
                          DataTable(columns: [
                            DataColumn(
                              label: Text('date'),
                            ),
                            DataColumn(
                              label: Text('nav'),
                            ),
                          ], rows: [
                            DataRow(cells: [
                              DataCell(
                                Text("${data['data'][index]['date']}"),
                              ),
                              DataCell(
                                Text("${data['data'][index]['nav']}"),
                              ),
                            ])
                          ])
                        ],
                      );
                    },
                  ))
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
