import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/providers/user_products.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../components/discount_alert_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  late DateTime expirationDate;
  String _date = 'Choose Expiration Date';
  bool dateUpdated = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

//validation and error related
  bool _submited = false;
  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    contactInfoController.dispose();
    dis1dateController.dispose();
    dis1percController.dispose();
    dis2dateController.dispose();
    dis2percController.dispose();
    dis3dateController.dispose();
    dis3percController.dispose();
    super.dispose();
  }

  var _selectedCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // prevent kepboard from pushing elements up
      //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //name
                  TextFormField(
                    onChanged: (_) {
                      setState(() {
                        
                      });
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        errorText:_submited? _errorTextName:null,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        label: Text('product name'),
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                  //price
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      onChanged: (_) {
                      setState(() {
                        
                      });
                    },
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          errorText: _submited?_errorTextPrice:null,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          label: Text('Price'),
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  //contact info
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      onChanged: (_) {
                      setState(() {
                        
                      });
                    },
                      controller: contactInfoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        errorText: _submited?_errorTextinfo:null,
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
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: SpinBox(
                            decoration:
                                InputDecoration(errorText: _submited?_errorTextQuantity:null),
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
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
                  //categories

                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: MultiSelectDialogField(
                      buttonIcon: _submited&&_selectedCategories==null?Icon(Icons.arrow_downward,color: Colors.redAccent,):null,
                      
                      buttonText: Text('select categories',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                          )),
                      items: Provider.of<Categories>(context)
                          .getCategories()
                          .map((e) => MultiSelectItem(e, e.name))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (values) {
                        _selectedCategories = values;
                      },
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
                                    : _submited?Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent
                                      ):null)
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
                                    : _submited?Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent
                                      ):null)
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                : _submited?Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent
                                      ):null)
                      ],
                    ),
                  ),
                  //date
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).primaryColor)),
                              onPressed: () {
                                showDatePicker(
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2001),
                                        lastDate: DateTime(2023),
                                        context: context)
                                    .then((value) {
                                  expirationDate = value!;
                                  setState(() {
                                    _date =
                                        dateFormat.format(value).toString();
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
                                : _submited?Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent
                                      ):null,
                          )
                        ],
                      ),
                    ),
                  ),
                  //image
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
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
                                : _submited?Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent
                                      ):null,
                          )
                        ],
                      ),
                    ),
                  ),

                  //discounts

                  // Image.file(File(widget._image.path))
                  Container(
                    height: MediaQuery.of(context).size.width*0.3,
                    width:MediaQuery.of(context).size.width*0.4,
                    child: imageUploaded ? Image.file(File(_image.path)) : null,
                  )
                ],
              )),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _submited = true;
              });
              if (_errorTextName == null &&
                  _errorTextPrice == null &&
                  _errorTextQuantity == null &&
                  _errorTextinfo == null
                  && _validateDiscount(1, context)&&_validateDiscount(2, context)
                  && _validateDiscount(3, context)&&imageUploaded&&dateUpdated
                  ) _addProduct(context);
            },
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
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      setState(() {
        _image = value;

        value != null ? imageUploaded = true : null;
      });
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
                    value: holder = discount == 1
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

  String? get _errorTextName {
    String text = nameController.value.text;
    if (text.isEmpty) {
      return ' Empty Field';
    }
    return null;
  }

  String? get _errorTextPrice {
    String text = priceController.value.text;
    if (text.isEmpty) {
      return ' Empty Field';
    }
    return null;
  }

  String? get _errorTextinfo {
    String text = contactInfoController.value.text;
    if (text.isEmpty) {
      return ' Empty Field';
    }
    return null;
  }

  String? get _errorTextQuantity {
    String text = quantityController.value.text;
    if (text.isEmpty) {
      return ' Empty Field';
    }
    return null;
  }

  Future<void> _addProduct(BuildContext context) async {
    List<int> datesAsint = [];
    datesAsint.add(int.parse(dis1percController.text));
    datesAsint.add(int.parse(dis2percController.text));
    datesAsint.add(int.parse(dis3percController.text));
    datesAsint.sort();

    var startDateForDiscount1 = dateFormat
        .format(expirationDate.subtract(Duration(days: datesAsint[0])));
    var EndDateForDiscount1 = dateFormat.format(expirationDate);

    var startDateForDiscount2 = dateFormat
        .format(expirationDate.subtract(Duration(days: datesAsint[1])));
    var EndDateForDiscount2 = dateFormat
        .format(expirationDate.subtract(Duration(days: datesAsint[0])));

    var startDateForDiscount3 = dateFormat
        .format(expirationDate.subtract(Duration(days: datesAsint[2])));
    var EndDateForDiscount3 = dateFormat
        .format(expirationDate.subtract(Duration(days: datesAsint[1])));

    Product toBeAddedProduct = Product(
        name: nameController.text,
        expirationDate: _date,
        //user contact info
        contactInfo: contactInfoController.text,
        quantity: 1,
        price: double.parse(priceController.text));

    String categoriesIDs = "";
    for (int i = 0; i < _selectedCategories.length; i++) {
      if (i == _selectedCategories.length - 1)
        categoriesIDs += _selectedCategories[i].id.toString();
      else
        categoriesIDs += _selectedCategories[i].id.toString() + ",";
    }

    await HttpService()
        .hopeCreate(
            File(_image.path),
            basename(File(_image.path).path),
            Provider.of<CurrentUserToken>(context, listen: false).getToken(),
            toBeAddedProduct,
            categoriesIDs,
            datesAsint[0].toString(),
            startDateForDiscount1,
            EndDateForDiscount1,
            datesAsint[1].toString(),
            startDateForDiscount2,
            EndDateForDiscount2,
            datesAsint[2].toString(),
            startDateForDiscount3,
            EndDateForDiscount3)
        .then((_) async {
      await Provider.of<Products>(context, listen: false).updateProducts();
      await Provider.of<UserProducts>(context, listen: false)
          .updateProducts(context);
          CallSnackBar(context, 'product has been added succesfully !');
      Navigator.of(context).pop();
      
    });
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
