import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/grid_item.dart';

class SearchGridItem extends StatelessWidget {
  String categoryName;
  bool isActivated;

  SearchGridItem({required this.categoryName, required this.isActivated});
  @override
  Widget build(BuildContext context) {
    return isActivated
        ? ClipRRect( borderRadius:  BorderRadius.all(Radius.circular(45)),
          child: Stack(clipBehavior:Clip.antiAlias ,children: [
            Container(color: Colors.green.shade200,),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              //TODO show tick 
              child: Icon(Icons.done,color: Colors.white,),
            ))
          ],),
        )
        
        : ClipRRect( borderRadius:  BorderRadius.all(Radius.circular(45)),
          child: Stack(clipBehavior:Clip.antiAlias ,children: [
            Container(color: mainColor,),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categoryName,style: TextStyle(color: Colors.white),),
            ))
          ],),
        );
  }
}
