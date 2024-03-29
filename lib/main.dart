import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @Date : 2022/03/07
/// @Author : daniel
/// @Description : 유저에게 앱 권한 요청하기
/// @Comment :
void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var contact ;

  @override
  void initState() {
    print("==// initState");
    super.initState();
    getContactPermission();
  }

  List<Contact> contacts = [];
  Map phones = {};

  delContact(id) async {
    print("==// delContact");
    var delContact = Contact();
    delContact.identifier = id;
    await ContactsService.deleteContact(delContact);
    getContact();
  }

  addContact(name, phone) async {
    print("==// addContact");
    var addContact = Contact();
    addContact.givenName = name;
    addContact.phones = [Item(label: 'mobile', value: phone)];
    await ContactsService.addContact(addContact);
    getContact();
  }

  getContact() async {
    print("==// getContact");
    var contacts = await ContactsService.getContacts();

    Map phoneBook = {};
    for (var i = 0; i < contacts.length; i++) {
      var phones = contacts[i].phones;
      phoneBook[i] = "no data";
      for (var j = 0; j < phones!.length; j++) {
        if (phones[j].label!.contains("mobile")) {
          phoneBook[i] = phones[j].value.toString();
          break;
        }
      }
    }

    setState(() {
      this.contacts = contacts;
      phones = phoneBook;
    });
  }

  getContactPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print("==// granted contact");
      getContact();
    } else if (status.isDenied) {
      print("==// denied contact");
    }
  }

  @override
  Widget build(BuildContext context) {
    // names.sort(); /// answer for question 4
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(contacts.length.toString()),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.pest_control)),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (c, i) {
            return ListTile(
              /*leading: Icon(
                Icons.account_circle,
                size: 10,
              ),*/
              // leading: Text(likes[i].toString()),
              title: Row(
                children: [
                  Text(
                    contacts[i].displayName.toString() + " : ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    phones[i] ?? 'no name',
                    style: TextStyle(fontSize: 12),
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
                          id: contacts[i].identifier,
                          delContact: delContact,
                        );
                      });

                  /// answer for question 3
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
                  addContact: addContact,
                );
              });
        },
      ),
    );
  }
}

class DeleteUI extends StatelessWidget {
  DeleteUI({Key? key, this.index, this.id, this.delContact}) : super(key: key);

  final index;
  final id;
  final delContact;

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
            Text(
              '삭제하시겠습니까?',
              style: TextStyle(fontSize: 30),
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
                      delContact(id);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(fontSize: 30),
                    )),
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
                  decoration: InputDecoration(helperText: 'name'),
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
                            addContact(name, phone);
                          }
                          Navigator.pop(context);
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
