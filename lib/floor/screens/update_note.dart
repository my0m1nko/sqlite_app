import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/floor/database/note_dao.dart';
import 'package:sqlite_app/floor/database/note_table.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({super.key});

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {


  @override
  Widget build(BuildContext context) {

    NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    TextEditingController title = TextEditingController();
    TextEditingController message = TextEditingController();
    title.text = note.title;
    message.text = note.message;
    return Scaffold(
      appBar: AppBar(
        title:const  Text(
          'Update Note'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: title,

              decoration: const InputDecoration(
                prefix: Icon(Icons.title),
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),

            ),
            const SizedBox(height: 8,),
            TextField(
              controller: message,
              decoration: const InputDecoration(
                prefix: Icon(Icons.title),
                hintText: 'Message',
                border: OutlineInputBorder(),
              ),

            ),
            const SizedBox(height: 8,),

            ElevatedButton(onPressed: (){
              noteDao.updateNote(Note(title.text, message.text,id: note.id));
              Get.back();
            }, child: const Text('Update Note')),
          ],
        ),
      )
    );
  }
}
