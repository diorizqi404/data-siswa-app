import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  const EditData({super.key, required this.list, required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  String? _jkValue;

  late TextEditingController controllerNama;
  late TextEditingController controllerAlamat;
  late TextEditingController controllerNomor;
  // late TextEditingController controllerStock;
  @override
  void initState() {
    // TODO: implement initState
    controllerNama =
        TextEditingController(text: widget.list[widget.index]['nama']);
    _jkValue = widget.list[widget.index]['jk'];
    controllerAlamat =
        TextEditingController(text: widget.list[widget.index]['alamat']);
    controllerNomor =
        TextEditingController(text: widget.list[widget.index]['nomor']);
    super.initState();
  }

  void editData() {
    // Silahkan ganti URL nya sesuai HOST nya
    var url = Uri.parse("https://dev404.serv00.net/editdata.php");
    http.post(url, body: {
      "nis": widget.list[widget.index]['nis'],
      "nama": controllerNama.text,
      "jk": _jkValue,
      "alamat": controllerAlamat.text,
      "nomor": controllerNomor.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "EDIT DATA SISWA",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controllerNama,
                decoration: const InputDecoration(
                    hintText: "Nama Siswa", labelText: "Nama Siswa"),
              ),
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text('Laki-laki'),
                    value: 'Laki-laki',
                    groupValue: _jkValue,
                    onChanged: (value) {
                      setState(() {
                        _jkValue = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                    groupValue: _jkValue,
                    onChanged: (value) {
                      setState(() {
                        _jkValue = value;
                      });
                    },
                  ),
                ],
              ),
              TextField(
                controller: controllerAlamat,
                decoration: const InputDecoration(
                    hintText: "Alamat", labelText: "Alamat"),
              ),
              TextField(
                controller: controllerNomor,
                decoration: const InputDecoration(
                    hintText: "Nomor HP", labelText: "Nomor HP"),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      editData();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18))),
                    label: const Text(
                      "EDIT DATA",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18))),
                    label: const Text(
                      "KEMBALI",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
