// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable, unused_field, deprecated_member_use, prefer_final_fields, library_private_types_in_public_api, unnecessary_null_comparison


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  TextEditingController _textController = TextEditingController();
  String _data = "";
  String _editKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase CRUD Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Enter data...',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_editKey.isEmpty) {
                createData(_textController.text);
              } else {
                updateData(_editKey, _textController.text);
              }
            },
            child: Text(_editKey.isEmpty ? 'Create' : 'Update'),
          ),
          const SizedBox(height: 20),
          Text('Data from Firebase: $_data'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // readData();
            },
            child: const Text('Read'),
          ),
        ],
      ),
    );
  }

  // Create data in Firebase
  void createData(String data) {
    databaseReference.push().set({'text': data});
    _textController.clear();
  }

  // Read data from Firebase
//   void readData() {
//   databaseReference.once().then((DataSnapshot snapshot) {
//     setState(() {
//       _data = "";
//       Map<String, dynamic> values = snapshot.value;
//       if (values != null) {
//         values.forEach((key, value) {
//           _data += "Key: $key, Text: ${value['text']}\n";
//         });
//       }
//     });
//   } as FutureOr Function(DatabaseEvent value));
// }

  // Update data in Firebase
  void updateData(String key, String newText) {
    databaseReference.child(key).update({'text': newText});
    setState(() {
      _editKey = "";
    });
    _textController.clear();
  }
}
