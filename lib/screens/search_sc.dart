import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project/components/call_snack_bar.dart';
import 'package:mini_project/components/rounded_button.dart';
import 'package:mini_project/components/search_grid_item.dart';
import 'package:mini_project/httpServices/search_http_service.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/providers/searched_products.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

//TODO create on/off buttons & show suggestions
class SearchSc extends StatefulWidget {
  static const route = 'search-screen';

  @override
  State<SearchSc> createState() => _SearchScState();
}

class _SearchScState extends State<SearchSc> {
  var selectedCategories = [];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var categories = Provider.of<Categories>(context).getCategories();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: selectedCategories.length != 0
            ? null
            : TextField(
                onSubmitted: (value) {
                  _searchByName(context, value);
                },
                controller: searchTextController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.insert_invitation,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      showDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2023),
                              context: context)
                          .then((value) {
                        _searchByDate(
                            context, dateFormat.format(value!).toString());
                      });
                    },
                  ),
                  border: InputBorder.none,
                  hintText: 'Search For Products',
                  hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withAlpha(90)),
                ),
              ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: selectedCategories.length == 0
                ? Text(
                    'Search By Categories',
                    style: TextStyle(color: mainColor, fontSize: 18),
                  )
                : null,
            margin: selectedCategories.length == 0 ? EdgeInsets.all(20) : null,
          ),
          SizedBox(
            height: selectedCategories.length == 0
                ? MediaQuery.of(context).size.height * 0.18
                : MediaQuery.of(context).size.height * 0.6,
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      if (selectedCategories.contains(categories[index])) {
                        setState(() {
                          selectedCategories.remove(categories[index]);
                        });
                      } else {
                        setState(() {
                          selectedCategories.add(categories[index]);
                        });
                      }
                    },
                    child: SearchGridItem(
                        categoryName: categories[index].name,
                        isActivated:
                            selectedCategories.contains(categories[index])),
                  );
                }),
          ),
          Container(
              child: selectedCategories.length == 0
                  ? null
                  : Container(
                      margin: EdgeInsets.all(15),
                      child: RoundedButton('Search', () {
                        _searchByCategoris(context);
                      }, 0.5, 0.07, backColor, mainColor)))
        ],
      ),
      bottomSheet: selectedCategories.length != 0
          ? Container(
              color: backColor,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedCategories.length.toString() +
                        " Categoris Are Selected",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Future<void> _searchByDate(BuildContext context, String date) async {
    await SearchHttpService().searchByExpirationDate(date).then((value) {
      Provider.of<Searched>(context, listen: false).setSearchedProducts(value);
    });
    Navigator.of(context).pushNamed(AllProductsSc.route_from_search);
  }

  _searchByCategoris(BuildContext context) async {
    //formatin the categories id's as a string of list
    String data = "";
    for (int i = 0; i < selectedCategories.length; i++) {
      if (i != selectedCategories.length - 1) {
        data += selectedCategories[i].id.toString() + ",";
      } else {
        data += selectedCategories[i].id.toString() + "";
      }
    }
    await SearchHttpService().searchByCategory(data).then((value) {
        Provider.of<Searched>(context, listen: false).setSearchedProducts(value);
    });
       Navigator.of(context).pushNamed(AllProductsSc.route_from_search);
  }

  _searchByName(BuildContext context, String value) async {
    await SearchHttpService().searchByName(value).then((value) {
      Provider.of<Searched>(context, listen: false).setSearchedProducts(value);
    });
    Navigator.of(context).pushNamed(AllProductsSc.route_from_search);
  }
}
