import 'package:flutter/material.dart';
import 'package:flutter_todo/password.dart';
import 'package:flutter_todo/sqflite.dart';

import 'next_page.dart';
import 'edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
  List<Password> passwordList = [];
  // Db定義
  Future<void> initDb() async {
    await DBProvider.setDb();
    passwordList = await DBProvider.getData();
    setState(() {});
  }

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.key),
                  title: Text(titleList[index]),
                  onTap: () {
                    print(passwordList);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextPage(titleList[index])));
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
        onPressed: () {
          // ルート
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Edit()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
