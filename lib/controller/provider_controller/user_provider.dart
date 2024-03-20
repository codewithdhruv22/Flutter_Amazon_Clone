import 'package:flutter/material.dart';

import '../../model/userModel.dart';

class UserProvider extends ChangeNotifier{

User _user = User(id: '', email: '', name:'', password: '', address: '', type: '', stamp: '');

User get user => _user;

void setUser(String user){
_user = User.fromJson(user);
notifyListeners();
}

}