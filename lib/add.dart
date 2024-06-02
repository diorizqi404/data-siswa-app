import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNis = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  String? _jkValue = 'Laki-laki';
  // TextEditingController controllerJk = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerNomor = TextEditingController();

  void addData() {
    // Silahkan ganti URL nya sesuai HOST nya
    var url = Uri.parse("http://10.0.2.2:88/siswa/adddata.php");
    http.post(url, body: {
      "nis": controllerNis.text,
      "nama": controllerNama.text,
      "jk": _jkValue,
      "alamat": controllerAlamat.text,
      "nomor": controllerNomor.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tambah Data Siswa",
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
                controller: controllerNis,
                decoration:
                    const InputDecoration(hintText: "NIS", labelText: "NIS"),
              ),
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
                      addData();
                      // Navigator.pop(context, 'refresh');
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
                      "ADD DATA",
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
