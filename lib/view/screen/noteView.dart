import 'package:flutter/material.dart';
import 'package:app_note/model/note_Model.dart';

class NoteView extends StatelessWidget {
  final NoteModel noteModel;

  const NoteView({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteModel.titel),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteModel.titel,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              noteModel.content,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Date: ${noteModel.data} - Time: ${noteModel.time}',
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 177, 92, 151)),
            ),
          ],
        ),
      ),
    );
  }
}
