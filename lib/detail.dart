import 'package:crud_flutter/main.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({super.key, required this.list, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String? _jkValue;

  @override
  void initState() {
    super.initState();
    _jkValue = widget.list[widget.index]['jk'];
  }

  void deleteData() {
    // Silahkan ganti URL nya sesuai HOST nya
    var url = Uri.parse("http://10.0.2.2:88/siswa/deletedata.php");
    http.post(url, body: {"nis": widget.list[widget.index]['nis']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list[widget.index]['nama']}",
          style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                // Text(
                //   widget.list[widget.index]['nis'],
                //   style: const TextStyle(fontSize: 20.0),
                // ),
                Text(
                  "NIS: ${widget.list[widget.index]['nis']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Nama Siswa: ${widget.list[widget.index]['nama']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                // Column(
                //   children: <Widget>[
                //     RadioListTile<String>(
                //       title: const Text('Laki-laki'),
                //       value: 'Laki-laki',
                //       groupValue: _jkValue,
                //       onChanged: (value) {
                //         setState(() {
                //           _jkValue = value;
                //         });
                //       },
                //     ),
                //     RadioListTile<String>(
                //       title: const Text('Perempuan'),
                //       value: 'Perempuan',
                //       groupValue: _jkValue,
                //       onChanged: (value) {
                //         setState(() {
                //           _jkValue = value;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                Text(
                  "Gender: ${widget.list[widget.index]['jk']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Alamat: ${widget.list[widget.index]['alamat']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Nomor HP: ${widget.list[widget.index]['nomor']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EditData(
                                  list: widget.list,
                                  index: widget.index,
                                )));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 18))),
                      label: const Text(
                        "EDIT",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        AlertDialog alertDialog = AlertDialog(
                          content: Text(
                              "Apakah yakin akan menghapus '${widget.list[widget.index]['nama']}'"),
                          actions: <Widget>[
                            ElevatedButton.icon(
                              onPressed: () {
                                deleteData();
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 18))),
                              label: const Text(
                                "Ok",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 18))),
                              label: const Text(
                                "Batal",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) => alertDialog,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 18))),
                      label: const Text(
                        "HAPUS",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
