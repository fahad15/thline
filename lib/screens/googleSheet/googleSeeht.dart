import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var uriscript =
    "https://script.google.com/macros/s/AKfycbxrKGwbX2dlWYH7IS3z4Hctg_mUP07YvlERdZqvpLtOKd0vYmw/exec";
//'https://script.google.com/macros/s/AKfycbxWXmkgCNRr5ojdx7Ca4DI6atm1cVFu3BqoHzA9eoNfQ0NBZdLG/exec';

class User {
  String id;
  String name;
  String email;
  String age;
  User({this.id, this.name, this.email, this.age});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        name: json["name"].toString(),
        email: json["email"].toString(),
        age: json["age"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "age": age,
      };
}

class GooglSheet extends StatefulWidget {
  GooglSheet({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _GooglSheetState createState() => _GooglSheetState();
}

class _GooglSheetState extends State<GooglSheet> {
  Future<List<User>> _getUsers() async {
    final data =
        await http.get(Uri.parse(uriscript + '?action=read&table=Sheet1'));
    final jsonData = Map.from(jsonDecode(data.body));
    return (jsonData['data'] as List)
        .map<User>((json) => new User.fromJson(json))
        .toList();
  }

  String searchString = "";
  final TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
        actions: [
          IconButton(
              icon: const Icon(Icons.person_outline_sharp),
              tooltip: 'Add Data',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalPage(User(id: '', name: '', email: ''), 'tambah'),
                  ),
                ).then((value) {
                  setState(() {
                    _getUsers();
                  });
                });
              }),
        ],
      ),
      body: Column(
        children: [
          TextField(onChanged: (value) {
            setState(() {
              searchString = value;
            });
          }),
          Expanded(
            child: FutureBuilder(
                future: _getUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Loading..."),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          // return snapshot.data.name
                          return
                              //.tolowerCase()
                              //.contains(searchString.toLowerCase())
                              ListTile(
                            leading: Text(snapshot.data[index].id),
                            title: Text(snapshot.data[index].name),
                            trailing: Text(snapshot.data[index].email),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => DetalPage(
                                          snapshot.data[index], 'ubah'))).then(
                                  (value) => setState(() => {_getUsers()}));
                            },
                          );
                          // : Container();
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class DetalPage extends StatelessWidget {
  final User user;
  final String aski;
  final TextEditingController idText = new TextEditingController();
  final TextEditingController nameText = new TextEditingController();
  final TextEditingController emailText = new TextEditingController();
  final TextEditingController ageText = new TextEditingController();
  DetalPage(this.user, this.aski);

  void tombol(String aski, context) {
    String editId;
    String editName;
    String editEmail;
    String editAge;
    editId = idText.text;
    editName = nameText.text;
    editEmail = emailText.text;
    editAge = ageText.text;
    var parameter;
    if (aski == 'tambah') {
      parameter =
          '?action=insert&table=Sheet1&data={"id" : "$editId","name" : "$editName", "email" :"$editEmail","age" : "$editAge"}';
    } else if (aski == 'ubah') {
      parameter =
          '?action=update&table=Sheet1&id= $editId&data={"name" : "$editName", "email" :"$editEmail","age" : "$editAge"}';
    } else if (aski == 'hapus') {
      parameter = '?action=delete&table=Sheet1&id= $editId';
    }
    http.get(Uri.parse(uriscript + parameter),
        headers: {"Accept": "application/json"});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    idText.text = user.id;
    nameText.text = user.name;
    emailText.text = user.email;
    ageText.text = user.email;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            controller: idText,
          ),
          TextField(controller: nameText),
          TextField(controller: emailText),
          TextField(controller: ageText),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(children: [
              if (aski != 'tambah')
                ElevatedButton(
                  onPressed: () {
                    tombol('ubah', context);
                  },
                  child: Text('ubah Data'),
                ),
              if (aski != 'tambah')
                ElevatedButton(
                  onPressed: () {
                    tombol('hapus', context);
                  },
                  child: Text('hapus Data'),
                ),
              if (aski == 'tambah')
                ElevatedButton(
                  onPressed: () {
                    tombol('tambah', context);
                  },
                  child: Text('Simbah Data Baru'),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
