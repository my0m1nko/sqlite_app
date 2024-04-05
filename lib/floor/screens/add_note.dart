import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/floor/database/note_dao.dart';
import 'package:sqlite_app/floor/database/note_table.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
   NoteDao noteDao = Get.find();

  TextEditingController controller = TextEditingController();
  TextEditingController msgController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text(
          'Add Note'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,

              decoration: const InputDecoration(
                prefix: Icon(Icons.title),
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),

            ),
            const SizedBox(height: 8,),
            TextField(
              controller: msgController,
              decoration: const InputDecoration(
                prefix: Icon(Icons.title),
                hintText: 'Message',
                border: OutlineInputBorder(),
              ),

            ),
            const SizedBox(height: 8,),

            ElevatedButton(onPressed: (){
              noteDao.addNote(Note(controller.text, msgController.text));
              Get.back();
            }, child: const Text('Add Note')),
          ],
        ),
      )
    );
  }
}
