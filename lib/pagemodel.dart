import 'package:flutter/material.dart';

class PageModel {
  String _titles;
  String _paragraph;

  PageModel(this._titles, this._paragraph);

  String get paragraph => _paragraph;

  String get titles => _titles;
}
