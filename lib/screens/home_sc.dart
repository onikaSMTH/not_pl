import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/components/home_search_button.dart';
import 'package:mini_project/components/vertical_grid.dart';
import '../components/horizontal_grid.dart';

//default page connected to the nav tab "home"
class HomeSc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView(
          children: [
           // const FloatingSearchBar(),
            ListTile(
              leading: const Text(
                'Popular',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              trailing: TextButton(
                onPressed: () {},
                child:  Text(
                  'Show all',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            HorizontalGrid(),
            ListTile(
                leading: const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Show all',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )),
            HorizontalGrid(),
            const ListTile(
                leading: Text(
              'All Products',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            )),
            const VerticalGrid(),
          ],
        ),
      ),
    );
  }
}
