import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'add.dart';
import 'detail.dart';

void main() {
  runApp(const MaterialApp(
    title: "Data Siswa",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    // Silahkan ganti URL nya sesuai HOST nya
    var url = Uri.parse("https://dev404.serv00.net/getdata.php");
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Siswa",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                getData();
              });
            },
            child: const Text('Refresh'),
          ),
          SizedBox(width: 16,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const AddData())),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data ?? [])
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  List list;
  // ignore: use_key_in_widget_constructors
  ItemList({required this.list});
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(list[i]['nama'], style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("NIS: ${list[i]['nis']}"),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Nomor: ${list[i]['nomor']}"),
                      ],
                    )
                  ],
                ),
                subtitle: Text("Alamat: ${list[i]['alamat']}",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: list[i]['jk'] == 'Laki-laki'
                    ? const Icon(Icons.male, color: Colors.blue, size: 64)
                    : const Icon(
                        Icons.female,
                        color: Colors.pink,
                        size: 64,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
