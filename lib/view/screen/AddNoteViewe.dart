import 'package:app_note/core/shared/CustomButton.dart';
import 'package:app_note/core/shared/CustomTextField.dart';
import 'package:flutter/material.dart';

// صفحة إضافة ملاحظة
class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key, required this.onPressed});
  final Function(String, String) onPressed;
  static TextEditingController titel = TextEditingController();
  static TextEditingController contant = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة ملاحظة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              CustomTextField(
                maxLines: true,
                controller: titel,
                hintText: 'عنوان الملاحظة',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                maxLines: false,
                controller: contant,
                hintText: 'الملاحظة',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    onPressed(
                      titel.text,
                      contant.text,
                    );

                    titel.clear();
                    contant.clear();
                    Navigator.pop(context);
                  }
                },
                name: 'حفظ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
