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
        /* =====// [1]
        // home: Text('Hello!') // Text
        // home: Icon(Icons.shop), // Icon
        // home: Image.asset('assets/dogecoin-og-logo.png') // Image
        home: Center(
          child: Container(width: 80, height: 93, color: Colors.blue) // Square Box : SizedBox()/Container()
          )
        */

        /* =====// [2]
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.pink,
              title: Text('App'),
            ),
            body: Text('Hello'),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone),
                    Icon(Icons.message),
                    Icon(Icons.contact_page),
                  ],
                ),
              ),
            ))

        // bottomNavigationBar: BottomAppBar(child: Text('bottom', textAlign: TextAlign.center,)),
      */

        /*// =====// [3] Box Design
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('App'),
        ),
        body: Align (
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            // margin: EdgeInsets.all(20), // all
            margin: EdgeInsets.fromLTRB(5, 30, 5, 50),
            // Left Right Top Bottom
            padding: EdgeInsets.all(20),
            child: Text('Test sentence'),
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid)
            ),

          ),
        ),
      ),
      */

        /*// =====// [4] TypoGraphy
      home: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.list),
          actions: [
            Icon(Icons.list),
            Icon(Icons.star),
            Icon(Icons.airplanemode_active),
          ],
          title: Text('App'),
        ),
        body: SizedBox(
          /*
          child: Text(
            'Hello',
            style: TextStyle(
              color: Color(0xffd70c0c),
              fontSize: 100,
            ),
          ),
          */
          /*
          child: IconButton(
            icon: Icon(Icons.airplanemode_active, size: 100,),
            onPressed: (){},
          ),
          */
        ),
      ),
      */

        /*// =====// [4] TypoGraphy - homework
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // title: Text('금호동 1가', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leadingWidth: double.maxFinite,
          leading: SizedBox(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text('금호동 3가', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              // margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.black, size: 40,),
                  Icon(Icons.list, color: Colors.black, size: 40,),
                  Icon(Icons.notifications_none, color: Colors.black, size: 40,),
                ],
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                // width: 120,
                child: Image.asset('Sony-Alpha-1iv.jpeg'),
              ),
              Container(
                width: 280,
                height: double.infinity,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    Text('소니 DSLR 100D (단렌즈, 충전기 16기가SD 포함)', style: TextStyle(fontSize: 25)),
                    Row(
                      children: [
                        Text('서울시 송파구', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        Text(' • ', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        Text('끌올 10분 전', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('210,000원', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite_border),
                    Text('4')
                  ]
                )
              )
            ],
          ),
        )
      ),
      */
        // =====// [4] TypoGraphy - homework answer
        home: Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 200,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Image.asset('Sony-Alpha-1iv.jpeg'),
            ),
            Flexible(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Text('소니 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                            style: TextStyle(fontSize: 25)),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Text('서울시 송파구',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                            Text(' • ',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                            Text('끌올 10분 전',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Text('210,000원',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [Icon(Icons.favorite_border), Text('4')],
                )
              ],
            ),
          ],
        ),
      ),
    )
        // */
        );
  }
}
