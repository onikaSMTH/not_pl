
import 'package:flutter/material.dart';

class Categories extends ChangeNotifier{

  List<dynamic> _categories=[];

 List<dynamic> getCategories(){
    return _categories;
  }
  setCategories(List <dynamic> list){
   _categories = list;
   notifyListeners();
  }
}