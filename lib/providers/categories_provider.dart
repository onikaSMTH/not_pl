
import 'package:flutter/material.dart';

class Categories extends ChangeNotifier{

  List<dynamic> categories=[];

 List<dynamic> getCategories(){
    return categories;
  }
  setCategories(List <dynamic> list){
   categories = list;
   notifyListeners();
  }
}