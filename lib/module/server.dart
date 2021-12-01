import 'package:flutter/material.dart';

// var uri = 'http://127.0.0.1:5000';
var uri = 'http://194.59.170.176:5000';

class user_info {
  int _id;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  user_info(this._id);
}
