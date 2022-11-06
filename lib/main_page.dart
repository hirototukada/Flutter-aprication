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

enum Main { google, amazon }

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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          )
        ],
        title: const Text('Flutter'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
          itemCount: passwordList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key, color: Colors.blue),
                  title: Text(
                    passwordList[index].name,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NextPage(passwordList, index: index)));
                    rebuild();
                  },
                  trailing: GestureDetector(
                    child: PopupMenuButton(
                      onSelected: popupMenuSelected,
                      itemBuilder: ((BuildContext context) =>
                          <PopupMenuEntry<Main>>[
                            const PopupMenuItem(
                                value: Main.google,
                                child: ListTile(
                                    leading: Icon(Icons.supervisor_account),
                                    title: Text('Edit Sgin in'))),
                            const PopupMenuItem(
                                value: Main.amazon,
                                child: ListTile(
                                    leading: Icon(Icons.supervisor_account),
                                    title: Text('Edit Sgin in'))),
                          ]),
                      child: const Text(
                        'Test',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const Divider(
                  height: 0,
                  color: Colors.grey,
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

  void popupMenuSelected(Main selectedMenu) {
    switch (selectedMenu) {
      case Main.google:
        _pushPage(context, Edit());
        break;
      case Main.amazon:
        _pushPage(context, Edit());
        break;
      default:
        break;
    }
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
  }
}
