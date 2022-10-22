import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = '';
    String password = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('追加画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ユーザー名',
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
                  onPressed: () {
                    print(name);
                  },
                  child: const Text('追加'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
