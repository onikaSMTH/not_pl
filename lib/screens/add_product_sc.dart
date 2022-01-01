import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/providers/token_provider.dart';
import '../components/discount_alert_dialog.dart';

class AddProductSc extends StatefulWidget {
  static String route = 'add-products-screen';

  @override
  State<AddProductSc> createState() => _AddProductScState();
}

class _AddProductScState extends State<AddProductSc> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController contactInfoController = TextEditingController();
  //discount 1 info
  TextEditingController dis1percController = TextEditingController(text: '0');
  TextEditingController dis1dateController = TextEditingController();
  //discount 2 info
  TextEditingController dis2percController = TextEditingController(text: '0');
  TextEditingController dis2dateController = TextEditingController();
  //discount 3 info
  TextEditingController dis3percController = TextEditingController(text: '0');
  TextEditingController dis3dateController = TextEditingController();
  //image
  late var _image;
  bool imageUploaded = false;
  //date
  String _date = 'Choose Expiration Date';
  bool dateUpdated = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // prevent kepboard from pushing elements up
      //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.95,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                TextFormField(
                  controller: nameController,
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
                    controller: priceController,
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: contactInfoController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        label: Text('Contact Info'),
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
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: SpinBox(
                          textStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          readOnly: true,
                          min: 1,
                          max: 100,
                          onChanged: (value) {
                            quantityController.text = value.toString();
                          },
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
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
                              onPressed: () {
                                _newDiscount(context, 1);
                              },
                              child: Text(
                                'Discount 1',
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor),
                              )),
                          Container(
                              child: _validateDiscount(1, context)
                                  ? Icon(
                                      Icons.task_alt,
                                      color: Colors.green,
                                    )
                                  : null)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
                              onPressed: () {
                                _newDiscount(context, 2);
                              },
                              child: Text(
                                'Discount 2',
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor),
                              )),
                          Container(
                              child: _validateDiscount(2, context)
                                  ? Icon(Icons.task_alt, color: Colors.green)
                                  : null)
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            _newDiscount(context, 3);
                          },
                          child: Text(
                            'Discount 3',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor),
                          )),
                      Container(
                          child: _validateDiscount(3, context)
                              ? Icon(Icons.task_alt, color: Colors.green)
                              : null)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  _date = dateFormat.format(value!).toString();
                                  dateUpdated = true;
                                });
                              });
                            },
                            child: Text(
                              _date,
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor),
                            )),
                        Container(
                          child: dateUpdated
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
                          child: imageUploaded
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
                  child: imageUploaded ? Image.file(File(_image.path)) : null,
                )
              ],
            )),
          ),
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
      _image = image;
      image != null ? imageUploaded = true : null;
    });
  }

  int sum = 0;
  List items = [];
  String current = '0';
  //double _value = 0.0;
  String holder = '0';
  void _newDiscount(BuildContext context, int discount) {
    items.clear();
    for (int i = 0; i <= 100; i += 5) {
      items.add('${i.toString()}');
    }

    showModalBottomSheet(
        builder: (BuildContext context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        
                        label: Text('Discount Percentage'),
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    value: holder= discount == 1
                            ? dis1percController.text
                            : discount == 2
                                ? dis2percController.text
                                : dis3percController.text,
                    onChanged: (value) {
                      setState(() {
                        if (discount == 1) {
                          dis1percController.text = value!;
                        } else if (discount == 2) {
                          dis2percController.text = value!;
                        } else {
                          dis3percController.text = value!;
                        }
                      });
                    },
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      );
                    }).toList()),
              ),
              Container(
// width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.all(10),
                child: TextField(
                  //set controller based on discount
                  controller: discount == 1
                      ? dis1dateController
                      : discount == 2
                          ? dis2dateController
                          : dis3dateController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: discount == 1
                          ? dis1dateController.text
                          : discount == 2
                              ? dis2dateController.text
                              : dis3dateController.text,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: Text('Apply Days Before Expiration Date'),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
            ],
          );
        },
        context: context);
  }

  void _addProduct(BuildContext context) {
    Product toBeAddedProduct = Product(
        name: nameController.text,
        image: File(_image.path),
        expirationDate: _date,
        //user contact info
        contactInfo: contactInfoController.text,
        quantity: int.parse(quantityController.text),
        price: double.parse(priceController.text));
  }

  bool _validateDiscount(int discount, BuildContext context) {
    if (discount == 1) {
      if (dis1dateController.text == dis2dateController.text ||
          dis1dateController.text == dis3dateController.text ||
          dis1percController.text.isEmpty ||
          dis1dateController.text.isEmpty) return false;
      return true;
    } else if (discount == 2) {
      if (dis1dateController.text == dis2dateController.text ||
          dis2dateController.text == dis3dateController.text ||
          dis2percController.text.isEmpty ||
          dis2dateController.text.isEmpty) return false;
      return true;
    } else {
      if (dis1dateController.text == dis3dateController.text ||
          dis2dateController.text == dis3dateController.text ||
          dis3percController.text.isEmpty ||
          dis3dateController.text.isEmpty) return false;
      return true;
    }
  }
}
