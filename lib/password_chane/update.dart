import 'package:flutter/material.dart';
import 'package:flutter_todo/password_chane/password.dart';
import 'package:flutter_todo/password_chane/sqflite.dart';

class Update extends StatefulWidget {
  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    String name = '';
    String password = '';
    String mail = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('編集'),
        backgroundColor: Colors.black87,
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(),
                    )),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(),
                    )),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(),
                    )),
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
                      await DBProvider.insertData(passwordList);
                      Navigator.pop(context);
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
