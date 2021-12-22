import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:image_picker/image_picker.dart';
import '../components/discount_alert_dialog.dart';
class AddProductSc extends StatefulWidget {
  static String route = 'add-products-screen';
  String date = 'Choose Expiration Date';
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  late XFile _image;

  @override
  State<AddProductSc> createState() => _AddProductScState();
}

class _AddProductScState extends State<AddProductSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    label: Text('Product Name'),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor)),
              ),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      label: Text('Quantity'),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),

              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                        )),
                  ),Container(
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
                          style:
                          TextStyle(color: Theme.of(context).backgroundColor),
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
                          style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
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
                        });
                      });
                    },
                    child: Text(
                      widget.date,
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)),
                    onPressed: () {
                      _imgFromLocal();
                    },
                    child: Text(
                      'Upload an image',
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                    )),
              ),

              //discounts

              // Image.file(File(widget._image.path))

            ],
          )),
        ),
      ),

    bottomSheet: Container(color: Theme.of(context).backgroundColor,
      height: MediaQuery.of(context).size.height*0.1,
      child: Center(child: TextButton(onPressed: () {  },
      child: Text('save',style: TextStyle(fontSize:20,color: Theme.of(context).primaryColor),),),),
    ) ,);
  }

  _imgFromLocal() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      widget._image = image!;
    });
  }
}
