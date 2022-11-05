import 'package:flutter/material.dart';
import 'package:flutter_todo/password.dart';
import 'package:flutter_todo/sqflite.dart';

import 'edit.dart';
import 'next_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Password> passwordList = [];
  // Db定義
  Future<void> initDb() async {
    await DBProvider.setDb();
    passwordList = await DBProvider.getData();
    setState(() {});
  }

  Future<void> rebuild() async {
    passwordList = await DBProvider.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
          itemCount: passwordList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key),
                  title: Text(passwordList[index].name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NextPage(passwordList, index: index)));
                    rebuild();
                  },
                ),
                const Divider(
                  height: 0,
                ), // 線
              ],
            );
          }),
      // 右下のボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ルート
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Edit()));
          rebuild();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
