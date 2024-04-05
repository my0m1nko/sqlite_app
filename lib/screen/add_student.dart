import 'package:flutter/material.dart';
import 'package:sqlite_app/database/database_helper.dart';
import 'package:sqlite_app/model/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
  String? name,email,phone,address;

  _addStudent(){
    if(_formKey.currentState != null && _formKey.currentState!.validate()){
    DatabaseHelper databaseHelper = DatabaseHelper();

      databaseHelper.insertStudent(
        Student.insertStudent(name: name ?? '', email: email ?? '', phone: phone ?? '', address: address ?? '')
      );
      //save to database
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Name is required';
                  }
                  return null;
                
                },
                onSaved: (newValue) => name = newValue,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'Enter Name'
                ),
              ),
              TextFormField(

                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Email is required';
                  }
                  return null;
                },
                onSaved: (newValue) => email = newValue,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                ),
              ),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Phone is required';
                  }
                  return null;
                },
                onSaved: (newValue) => phone = newValue,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.phone),
                  labelText: 'Phone',
                  hintText: 'Enter Phone'
                ),
              ),
               TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Address is required';
                  }
                  return null;
                },
                onSaved: (newValue) => address = newValue,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.location_city),
                  labelText: 'Address',
                  hintText: 'Enter Address'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _addStudent,
                child: const Text('Add Student'),
              )
            ],
          ),
        ),
      ),
    );
  }
}