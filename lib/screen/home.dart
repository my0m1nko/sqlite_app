import 'package:flutter/material.dart';
import 'package:sqlite_app/database/database_helper.dart';
import 'package:sqlite_app/screen/add_student.dart';
import 'package:sqlite_app/screen/update_student.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD'),
      ),
      body: FutureBuilder(
        future: DatabaseHelper().getAllStudents(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(snapshot.data![index]['name']),
                    subtitle: Text(snapshot.data![index]['address']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            DatabaseHelper()
                                .deleteStudent(snapshot.data![index]['id']);
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async{
                            var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UpdateStudent(
                                  id: snapshot.data![index]['id'],
                                  name: snapshot.data![index]['name'],
                                  email: snapshot.data![index]['email'],
                                  address: snapshot.data![index]['address'],
                                  phone: snapshot.data![index]['phone'],
                                ),
                              ),
                            );

                            if(res == 'success'){
                              setState(() {

                              });
                            }
                          },
                        ),
                      ],
                    )
                    );
              },
            );
          } else {
            // DatabaseHelper().deleteAllStudents();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Navigate to home screen
                setState(() {
                  
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Delete the entire database
                DatabaseHelper().deleteAllStudents();
                setState(() {
                  
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const AddStudent()),
          );

          if (result == 'success') {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
