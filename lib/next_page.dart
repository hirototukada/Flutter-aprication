import 'package:flutter/material.dart';
import 'package:flutter_todo/password.dart';

class NextPage extends StatefulWidget {
  final List<Password> passwordList;
  final int? index;
  NextPage(this.passwordList, {this.index});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String passTitle = '';
  String password = '';
  String userId = '';
  bool isEdit = false;
  void initEdit() {
    if (widget.index != null) {
      passTitle = widget.passwordList[widget.index!].name;
      password = widget.passwordList[widget.index!].password;
      userId = widget.passwordList[widget.index!].userId;
    }
    setState(() {});
  }

  void switchEdit() {
    if (isEdit) {
      isEdit = false;
    } else {
      isEdit = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initEdit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leadingWidth: 40,
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: (!isEdit) ? const Text('編集') : const Text('キャンセル'),
            ),
            onTap: () {
              switchEdit();
              print(isEdit);
            },
          ),
        ],
        centerTitle: true,
        title: Text(passTitle),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: const [
              Text(
                'ユーザー名（メールアドレス）',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                (isEdit)
                    ? Text(
                        userId,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.blue),
                      )
                    : TextField(
                        decoration: const InputDecoration(
                          hintText: 'ID or mail',
                        ),
                        onChanged: ((text) {
                          print(text);
                        }),
                      ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: const [
              Text(
                'パスワード',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ]),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      userId,
                      style: const TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
