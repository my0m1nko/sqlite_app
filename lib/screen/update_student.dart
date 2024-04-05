import 'package:flutter/material.dart';
import 'package:sqlite_app/database/database_helper.dart';
import 'package:sqlite_app/model/student.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({super.key, this.name, this.email, this.phone, this.address, this.id});
  final String? name, email, phone, address;
  final int? id;

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name, email, phone, address;
  int? id;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    email = widget.email;
    phone = widget.phone;
    address = widget.address;
    id = widget.id;

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                onSaved: (newValue) => name = newValue,
                decoration: const InputDecoration(
                    prefix: Icon(Icons.person),
                    // labelText: 'Name',
                    hintText: 'Enter Name'),
              ),
              TextFormField(
                initialValue: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                onSaved: (newValue) => email = newValue,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.email),
                  // labelText: 'Email',
                  hintText: 'Enter Email',
                ),
              ),
              TextFormField(
                initialValue: phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone is required';
                  }
                  return null;
                },
                onSaved: (newValue) => phone = newValue,
                decoration: const InputDecoration(
                    prefix: Icon(Icons.phone),
                    // labelText: 'Phone',
                    hintText: 'Enter Phone'),
              ),
              TextFormField(
                initialValue: address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                onSaved: (newValue) => address = newValue,
                decoration: const InputDecoration(
                    prefix: Icon(Icons.location_city),
                    // labelText: 'Address',
                    hintText: 'Enter Address'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                   int res = await DatabaseHelper().updateStudent(
                        Student.insertStudent(
                            name: name ?? '',
                            email: email ?? '',
                            phone: phone ?? '',
                            address: address ?? ''),id!
                            );
                    Navigator.pop(context, 'success');

                  }
                },
                child: const Text('Update Student'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
