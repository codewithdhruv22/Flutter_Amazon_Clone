import 'dart:convert';

class User{
  final String id;
  final String email;
  final String name;
  final String password;
  final String address;
  final String type;
  final String stamp;
  

 User({


required this.id,
required this.email,
required this.name,
required this.password,
required this.address,
required this.type,
required this.stamp,


 });


Map<String,dynamic> fromAppToDB(){
  return {


'id' : id,
'email' : email,
'name' : name,
'password' : password,
'address' : address,
'type' : type,
'stamp' : stamp,


  };
}



factory User.fromDBtoApp(Map<String, dynamic> map){
  return User(
id : map['id'] ?? '',
email : map['email'] ?? '',
name : map['name'] ?? '',
password : map['password'] ?? '',
address : map['address'] ?? '',
type : map['type'] ?? '',
stamp : map['stamp'] ?? '',

  );
}


factory User.fromJson(String source) => User.fromDBtoApp(jsonDecode(source));
}