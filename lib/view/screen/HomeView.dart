import 'package:app_note/model/note_Model.dart';
import 'package:app_note/view/screen/AddNoteViewe.dart';
import 'package:app_note/view/screen/editNote.dart';
import 'package:app_note/view/widget/bottonadd.dart';
import 'package:app_note/view/widget/drawr.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NoteModel> data = [];
  List<NoteModel> filteredData = [];
  String searchQuery = "";
  bool isSearching = false;

  // إضافة ملاحظة جديدة إلى القائمة
  void addNoteView(String title, String content) {
    data.add(NoteModel(
      titel: title,
      content: content,
      data:
          '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
      time:
          '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
    ));

    updateFilteredData();
  }

  // تحديث قائمة البيانات المفلترة بناءً على نص البحث
  void updateFilteredData() {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredData = data;
      } else {
        filteredData = data
            .where((note) =>
                note.titel.toLowerCase().contains(searchQuery.toLowerCase()) ||
                note.content.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredData = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                onChanged: (value) {
                  searchQuery = value;
                  updateFilteredData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'ابحث عن ملاحظة...',
                  border: InputBorder.none,
                ),
              )
            : const Text('الملاحظات'),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchQuery = "";
                  updateFilteredData();
                }
              });
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          final note = filteredData[index];
          return Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      data.removeAt(index); // حذف الملاحظة من القائمة
                      updateFilteredData();
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 249, 242, 242),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  icon: Icons.delete,
                  label: 'حذف',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // تمرير بيانات الملاحظة الحالية إلى صفحة التعديل
                    EditNote.titel.text = note.titel;
                    EditNote.contant.text = note.content;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNote(
                          note: note,
                          onPressed: (updatedTitle, updatedContent) {
                            // تحديث الملاحظة
                            setState(() {
                              data[index] = NoteModel(
                                titel: updatedTitle,
                                content: updatedContent,
                                data: note.data, // الاحتفاظ بالتاريخ الأصلي
                                time: note.time, // الاحتفاظ بالوقت الأصلي
                              );
                              updateFilteredData();
                            });
                          },
                        ),
                      ),
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  icon: Icons.edit,
                  label: 'تعديل',
                ),
              ],
            ),
            child: bottonadd(note: note),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddNoteView(
              onPressed: (title, content) {
                addNoteView(title, content);
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 38, 114, 155),
        ),
      ),
    );
  }
}
