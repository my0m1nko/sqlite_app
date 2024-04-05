import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/floor/database/note_database.dart';
import 'package:sqlite_app/floor/screens/home_screen.dart';
import 'package:sqlite_app/screen/home.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Sqlite Database',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data){
          if(data.hasData){
            Get.put(data.data!.noteDao);
            return const HomeScreen();
          }else if(data.hasError){

            return const Center(
              child:
              Text('ERROR')
            );
          }
          else{
            return const Center(child: Text('Loading ....'),);

          }
        },
      ),
    );
  }
}
