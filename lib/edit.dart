import 'package:flutter/material.dart';
import 'package:flutter_todo/password.dart';
import 'package:flutter_todo/sqflite.dart';

class Edit extends StatelessWidget {
  void setState(Null Function() param0) {}
  Future<void> initDb() async {
    await DBProvider.setDb();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String password = '';
    String mail = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('追加画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: '登録名',
                ),
                onChanged: ((text) {
                  name = text;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ID or mail',
                ),
                onChanged: ((text) {
                  mail = text;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'パスワード',
                ),
                onChanged: ((text) {
                  password = text;
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Password passwordList = Password(
                          name: name, userId: mail, password: password);
                      print(name);
                      await DBProvider.insertData(passwordList);
                    },
                    child: const Text('追加'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
