import 'package:flutter/material.dart';
class DiscountDialaog{

  showDialoge(BuildContext context){
    showDialog<String>(context: context, builder: (context)=>AlertDialog(
      title: Center(child: Text('Discount Info',style: TextStyle(color: Theme.of(context).primaryColor),)),
      actions: [
        Container(
          // width: MediaQuery.of(context).size.width * 0.2,
          margin: EdgeInsets.all( 10),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor)),
                label: Text('Discount'),
                labelStyle:
                TextStyle(color: Theme.of(context).primaryColor)),
          ),

        ),
        Container(
          // width: MediaQuery.of(context).size.width * 0.2,
          margin: EdgeInsets.all( 10),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor)),
                label: Text('Apply Days Before Expiration Date'),
                labelStyle:
                TextStyle(color: Theme.of(context).primaryColor)),
          ),

        ),
        TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('ok',style: TextStyle(color: Theme.of(context).primaryColor),))
      ],
    ));
  }
}