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
  void initEdit() {
    if (widget.index != null) {
      passTitle = widget.passwordList[widget.index!].name;
      password = widget.passwordList[widget.index!].password;
      userId = widget.passwordList[widget.index!].userId;
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
      appBar: AppBar(
        title: Text(widget.passwordList[widget.index!].name),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 60,
                  child: Text(
                    'ID',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  passTitle,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            //余白
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 60,
                  child: Text(
                    'pw',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  userId,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 60,
                  child: Text(
                    'user',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  userId,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
