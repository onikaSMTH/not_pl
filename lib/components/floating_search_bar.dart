import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomeFloatingSearch extends StatefulWidget {
  const HomeFloatingSearch({Key? key}) : super(key: key);

  @override
  _HomeFloatingSearchState createState() => _HomeFloatingSearchState();
}

class _HomeFloatingSearchState extends State<HomeFloatingSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        child: FloatingSearchBar(
            width: MediaQuery.of(context).size.width * 0.8,
            margins: const EdgeInsets.only(top: 10),
            hint: 'Search For Products',
            backdropColor: Colors.redAccent,
            backgroundColor: Colors.white,
            actions: [
              FloatingSearchBarAction.searchToClear(
                showIfClosed: true,
              )
            ],
            builder: (BuildContext context, Animation<double> transition) {
              //To BE FIXED
              // show search preferences tabs
              return Row(
                children: const [Text('Category'), Text('Date')],
              );
            }));
  }
}
