import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @Date : 2022/03/07
/// @Author : daniel
/// @Description : 유저에게 앱 권한 요청하기
/// @Comment :
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('allowed contact');
    } else if (status.isDenied) {
      print('not allowed contact');
      Permission.contacts.request();
      openAppSettings();
    }
  }

  getCamera() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print('allowed camera');
    } else if (status.isDenied) {
      print('not allowed camera');
      Permission.camera.request();
      openAppSettings();
    }
  }

  /*@override
  void initState() {
    super.initState();
    getPermission();
  }*/

  var names = [];
  var phones = [];
  var likes = [];

  var phoneBook = [];
  Map contact = {};

  addContact(name, phone) {
    setState(() {
      contact = {};
      contact["name"] = name;
      contact["phone"] = phone;
      phoneBook.add(contact);
    });
    print(phoneBook);
  }

  removeContact(index) {
    setState(() {
      phoneBook.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // names.sort(); /// answer for question 4
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(phoneBook.length.toString()),
        actions: [
          IconButton(onPressed: (){getPermission();}, icon: Icon(Icons.contacts)),
          IconButton(onPressed: (){getCamera();}, icon: Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: phoneBook.length.toInt(),
          itemBuilder: (c, i) {
            return ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 30,
              ),
              // leading: Text(likes[i].toString()),
              title: Row(
                children: [
                  Text(
                    "[" + phoneBook[i]["name"] + "] : ",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    phoneBook[i]["phone"],
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                child: Text('Delete'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteUI(
                          removeContact: removeContact,
                          index: i,
                        );
                      }
                  ); /// answer for question 3
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Text('ADD'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(
                  // addOne: addOne,
                  // addName: addName,
                    addContact: addContact
                );

              });
        },
      ),
    );
  }
}

class DeleteUI extends StatelessWidget {
  DeleteUI({Key? key, this.removeContact, this.index}) : super(key: key);

  final removeContact;
  final index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 200,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('삭제하시겠습니까?', style: TextStyle(fontSize: 30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel', style: TextStyle(fontSize: 30),)),
                TextButton(onPressed: (){
                  removeContact(index);
                  Navigator.pop(context);
                }, child: Text('Delete', style: TextStyle(fontSize: 30),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addContact}) : super(key: key);

  final addContact;

  var nameData = TextEditingController();
  var phoneData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Contact',
                  style: TextStyle(fontSize: 40),
                ),
                TextField(
                  decoration: InputDecoration(
                    helperText: 'name'
                  ),
                  controller: nameData,
                  // onChanged: (text){ inputData2 = text; print(inputData2);},
                  style: TextStyle(fontSize: 25),
                ),
                TextField(
                  decoration: InputDecoration(
                    helperText: 'phone number',
                  ),
                  controller: phoneData,
                  // onChanged: (text){ inputData2 = text; print(inputData2);},
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 30),
                        )),
                    TextButton(
                        onPressed: () {
                          var name = nameData.text;
                          var phone = phoneData.text;
                          if (name.isNotEmpty && phone.isNotEmpty) {
                            addContact(name.toString(), phone.toString());

                          } /// answer for question 2, 5
                          Navigator.pop(context); /// answer for question 1
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 30),
                        )),
                  ],
                )
              ],
            )));
  }
}
