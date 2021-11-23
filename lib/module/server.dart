import 'package:flutter/material.dart';

// var uri = 'http://127.0.0.1:5000';
var uri = 'http://192.168.1.4:3000';

class user_info {
  int _id;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  user_info(this._id);
}
