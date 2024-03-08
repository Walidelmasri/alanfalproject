import 'package:alanfaladmin/models/user.dart';
import 'package:alanfaladmin/service/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  UserServices _userServices = UserServices();
  List<UserModel> users = [];
  List<UserModel> usersSearched = [];


  UserProvider.initialize(){
    loadUsers();
  }

  loadUsers()async{
    users = await _userServices.getUsers();
    notifyListeners();
  }

  Future search({String userName})async{
    usersSearched = await _userServices.searchUsers(userName: userName);
    notifyListeners();
  }

}