import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/components/home_search_button.dart';
import 'package:mini_project/components/vertical_grid.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:provider/provider.dart';
import '../components/horizontal_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              leading: Text(
                AppLocalizations.of(context)!.popular,
                style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.showAll,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            HorizontalGrid(),
            ListTile(
                leading: Text(
                  AppLocalizations.of(context)!.categories,
                  style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.showAll,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )),
            HorizontalGrid(),
            ListTile(
              onTap: (){
                Navigator.of(context).pushNamed(AllProductsSc.route_from_all);
              },
                leading: Text(
              AppLocalizations.of(context)!.allProducts,
              style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontSize: 20),
            )),
            VerticalGrid(),
          ],
        ),
      ),
    );
  }
}
