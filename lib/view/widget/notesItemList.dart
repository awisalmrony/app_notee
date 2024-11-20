import 'package:app_note/model/note_Model.dart';
import 'package:flutter/material.dart';

Widget notesItemList({required NoteModel noteModel}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      title: Text(
        noteModel.titel,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(noteModel.content),
          const SizedBox(height: 5),
          Text(
            '${noteModel.data} - ${noteModel.time}',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      isThreeLine: true,
    ),
  );
}
