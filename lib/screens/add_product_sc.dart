
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:image_picker/image_picker.dart';
import '../components/discount_alert_dialog.dart';

class AddProductSc extends StatefulWidget {
  static String route = 'add-products-screen';
  String date = 'Choose Expiration Date';
  bool dateUpdated = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  late var _image;
  bool imageUploaded = false;

  @override
  State<AddProductSc> createState() => _AddProductScState();
}

class _AddProductScState extends State<AddProductSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // prevent kepboard from pushing elements up
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    label: Text('Product Name'),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
              //price
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: Text('Price'),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ),
              //quantity
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: SpinBox(
                        textStyle: TextStyle(color: Theme.of(context).primaryColor),
                        readOnly: true,
                        min: 1,
                        max: 100,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: () {
                          DiscountDialaog().showDialoge(context);
                        },
                        child: Text(
                          'Discount 1',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: () {
                          DiscountDialaog().showDialoge(context);
                        },
                        child: Text(
                          'Discount 2',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor)),
                        onPressed: () {
                          DiscountDialaog().showDialoge(context);
                        },
                        child: Text(
                          'Discount 3',
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(width: MediaQuery.of(context).size.width*0.5,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            showDatePicker(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2022),
                                    context: context)
                                .then((value) {
                              setState(() {
                                widget.date =
                                    widget.dateFormat.format(value!).toString();
                                widget.dateUpdated=true;
                              });
                            });
                          },
                          child: Text(
                            widget.date,
                            style:
                                TextStyle(color: Theme.of(context).backgroundColor),
                          )),
                      Container(
                        child: widget.dateUpdated? const Icon(
                          Icons.task_alt,
                          color: Colors.green,
                        )

                          : null,
                      )],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            _imgFromLocal();
                          },
                          child: Text(
                            'Upload an image',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor),
                          )),
                      //TODO change icons to tick
                      Container(
                        child: widget.imageUploaded
                            ? const Icon(
                                Icons.task_alt,
                                color: Colors.green,
                              )
                            : null,
                      )
                    ],
                  ),
                ),
              ),

              //discounts

              // Image.file(File(widget._image.path))
          Container(
            child: widget.imageUploaded?Image.file(File(widget._image.path)) :null,
          )
            ],
          )),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'ADD',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).backgroundColor),
            ),
          ),
        ),
      ),
    );
  }

  _imgFromLocal() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      widget._image = image;
      widget.imageUploaded = true;
    });
  }
}
