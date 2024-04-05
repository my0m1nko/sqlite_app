import 'package:flutter/material.dart';
import 'package:sqlite_app/database/database_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
      ),
      body: FutureBuilder(
        future: DatabaseHelper().getAllStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index]['name']),
                  subtitle: Text(snapshot.data![index]['address']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      DatabaseHelper().deleteStudent(snapshot.data![index]['id']);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),


      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add'); 

        },
        child: const Icon(Icons.add),
      ),


    );
  }
}