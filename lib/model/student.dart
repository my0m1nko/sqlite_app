class Student{

  // String? name;
  // String? email;
  // String? phone;
  // String? address;

  // Student({this.name, this.email, this.phone, this.address});

  // Map<String, dynamic> toMap(){
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'address': address
  //   };
  // }

  static Map<String, dynamic> insertStudent({required String name, required String email, required String phone, required String address}){
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address
    };
  }
}