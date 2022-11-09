import 'package:flutter/material.dart';
import 'package:flutter_todo/password_chane/password.dart';
import 'package:flutter_todo/password_chane/sqflite.dart';

class Update extends StatefulWidget {
  final List<Password> passwordList;
  final int? index;

  Update(this.passwordList, {this.index});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    String name = widget.passwordList[widget.index!].name;
    String password = widget.passwordList[widget.index!].password;
    String mail = widget.passwordList[widget.index!].userId;

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
                    hintText: widget.passwordList[widget.index!].name,
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
                    hintText: widget.passwordList[widget.index!].userId,
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
                    hintText: widget.passwordList[widget.index!].password,
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
                          id: widget.index!,
                          name: name,
                          userId: mail,
                          password: password);
                      await DBProvider.updateData(passwordList);
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
