import 'package:app_note/model/note_Model.dart';
import 'package:app_note/view/screen/noteView.dart';
import 'package:app_note/view/widget/notesItemList.dart';
import 'package:flutter/material.dart';

class bottonadd extends StatelessWidget {
  const bottonadd({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // عند الضغط على الملاحظة، سيتم فتح صفحة عرض الملاحظة
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteView(noteModel: note),
          ),
        );
      },
      child: notesItemList(noteModel: note), // استخدم الاسم الصحيح للدالة هنا
    );
  }
}
