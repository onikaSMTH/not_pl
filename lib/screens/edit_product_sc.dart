import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/httpServices/url.dart';
import 'package:mini_project/models/category_model.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/providers/user_products.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import '../components/discount_alert_dialog.dart';

class EditProductSc extends StatefulWidget {
  static String route = 'edit-products-screen';

  @override
  State<EditProductSc> createState() => _AddProductScState();
}

class _AddProductScState extends State<EditProductSc> {
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
  DateTime expirationDate = DateTime.now();
  String _date = 'Choose Expiration Date';
  bool dateUpdated = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

//product id
  var productID;
//run did change once
  bool once = true;

  //error related
  bool _submited = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (once) {
      Product product = Provider.of<SingleProduct>(context).getProduct();
      var categories = Provider.of<SingleProduct>(context).getCategories();
      nameController.text = product.name;
      priceController.text = product.price.toString();
      quantityController.text = product.quantity.toString();
      contactInfoController.text = product.contactInfo.toString();
      _image = product.image.toString().substring(7);
      _date = product.expirationDate;
      _selectedCategories = categories;
      productID = product.id;
      once = false;
    }
    super.didChangeDependencies();
  }

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
        iconTheme: IconThemeData(color: mainColor),
        backgroundColor: backColor,
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
                    controller: nameController,
                    decoration: InputDecoration(
                        errorText: _submited ? _errorTextName : null,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: mainColor)),
                        label: Text('Product Name'),
                        labelStyle:
                            TextStyle(color: mainColor)),
                  ),
                  //price
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          errorText: _submited ? _errorTextPrice : null,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: mainColor)),
                          label: Text('Price'),
                          labelStyle:
                              TextStyle(color: mainColor)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: contactInfoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          errorText: _submited ? _errorTextinfo : null,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: mainColor)),
                          label: Text('Contact Info'),
                          labelStyle:
                              TextStyle(color: mainColor)),
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
                              color: mainColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: SpinBox(
                            decoration: InputDecoration(
                              errorText: _submited ? _errorTextQuantity : null,
                            ),
                            value: double.parse(quantityController.text),
                            textStyle: TextStyle(
                                color: mainColor),
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
                      buttonIcon: _submited && _selectedCategories == null
                          ? Icon(
                              Icons.arrow_downward,
                              color: Colors.redAccent,
                            )
                          : null,
                      initialValue: _selectedCategories,
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

//date
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                         mainColor)),
                              onPressed: () {
                                showDatePicker(
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2001),
                                        lastDate: DateTime(2023),
                                        context: context)
                                    .then((value) {
                                  expirationDate = value!;
                                  setState(() {
                                    _date = dateFormat.format(value).toString();
                                    dateUpdated = true;
                                  });
                                });
                              },
                              child: Text(
                                _date,
                                style: TextStyle(
                                    color: backColor),
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                         mainColor)),
                              onPressed: () {
                                _imgFromLocal();
                              },
                              child: Text(
                                'Edit image',
                                style: TextStyle(
                                    color: backColor),
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
      ),
      bottomSheet: Container(
        color: mainColor,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _submited = true;
              });
              _editProduct(context);
            },
            child: Text(
              'Edit',
              style: TextStyle(
                  fontSize: 20, color: backColor),
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

  int sum = 0;
  List items = [];
  String current = '0';
  //double _value = 0.0;
  String holder = '0';

  Future<void> _editProduct(BuildContext context) async {
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
        id: productID,
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
        .hopeUpdate(
            File(_image.path),
            Path.basename(File(_image.path).path),
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
      CallSnackBar(context, 'product has been Edited succesfully !');
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
