import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('追加画面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: const Text('ID'),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: const Text('パスワード'),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
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
