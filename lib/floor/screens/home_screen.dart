import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/floor/database/note_dao.dart';
import 'package:sqlite_app/floor/database/note_database.dart';
import 'package:sqlite_app/floor/database/note_table.dart';
import 'package:sqlite_app/floor/screens/add_note.dart';
import 'package:sqlite_app/floor/screens/update_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // final NoteDao noteData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NoteDao noteDao = Get.find();

  //  late NoteDao noteDao;
  //
  //  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   noteDao = widget.noteData;
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Database'),
      ),
      // body: ,
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
              onPressed: (){
              Get.to(const AddNote());
              },
              // onPressed: () async{
              //   await noteDao.addNote(Note('Daily Task Reading', "Reading is the Best message"));
              // },
          child: const Icon(Icons.add),),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'delete',
              onPressed: (){
                noteDao.deleteAllNote();
              },
            child:const  Icon(Icons.delete),
          )
        ],
      ),
    );
  }
  
  Widget noteList(){
    return StreamBuilder<List<Note>>(
        stream: noteDao.getAllNote(),
        builder: (_,data){
    if(data.hasData) {
      return ListView.builder(
        itemCount: data.data?.length,

        itemBuilder: (_, position) {
          return ListTile(
            title: Text(data.data![position].title),
            subtitle: Text(data.data![position].message),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                noteDao.delete(data.data![position].id!);

              },
            ),
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Get.to(UpdateNote(),arguments: data.data![position]);
              },
            ),
          );
        },
      );
    } else if( data.hasError){
      return const Text('ERROR DATA');
    }
    else{
      return const Center(child: Text('No Data'));
    }
    }
    );
  }
}
