import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('Notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('SAVE'))
        ],
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}