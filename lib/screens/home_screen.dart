import 'dart:convert';
import 'package:announcement_app/entities/authentication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Authentication> items = [];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          top(screenHeight),
          announcementArea(
            screenHeight,
          ),
          ElevatedButton(
              onPressed: () {
                fetchItems();
              },
              child: Text("get"))
        ],
      ),
    );
  }

  Widget top(double screenHeight) {
    return Container(
      height: screenHeight / 14,
      color: const Color.fromARGB(255, 255, 0, 0),
    );
  }

  Widget announcementArea(double screenHeight) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: screenHeight / 2.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 255, 255, 255)),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              children: [Text(items[index].announcemenetType.toString())],
            );
          },
        ),
      ),
    );
  }

  Future fetchItems() async {
    final response = await http
        .get(Uri.parse('http://localhost:8080/api/announcement/getAll'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        items =
            jsonResponse.map((item) => Authentication.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load items');
    }
  }
}
