import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
              ),
              Text(
                'Daniel',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
              ),
              Text(
                'Daniel',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
              ),
              Text(
                'Daniel',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomElement(),
    ));
  }
}

class BottomElement extends StatelessWidget {
  const BottomElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.contact_page_outlined),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
