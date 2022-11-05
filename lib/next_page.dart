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
  @override
  Widget build(BuildContext context) {
    // print(widget.passwordList[widget.index].name);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.passwordList[widget.index!].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 30,
                  child: Text('ID'),
                ),
                Text(': 毎回同じIDを表示'),
              ],
            ),
            //余白
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                  child: Text('PW'),
                ),
                Text(': 毎回同じパスワードを表示'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
