import 'package:flutter/material.dart';
import 'package:mini_project/components/vertical_grid.dart';
import 'package:mini_project/httpServices/product_http_service.dart';
import 'package:mini_project/models/category_model.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:provider/provider.dart';
import '../components/horizontal_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//default page connected to the nav tab "home"
class HomeSc extends StatefulWidget {
  List<Product> products = [];
  List<Category> categories = [];

  @override
  State<HomeSc> createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration.zero).then((_) async {
        await HttpService().getProducts().then((value) {
          Provider.of<Products>(context, listen: false).setProducts(value);
        });
        await HttpService().getCategories().then((value) {
          Provider.of<Categories>(context, listen: false).setCategories(value);
        });
      });
    }
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

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
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            /*   trailing: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.showAll,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ), */
            ),
            HorizontalGrid(
              isPopular: true,
            ),
            ListTile(
                leading: Text(
                  AppLocalizations.of(context)!.categories,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                /* trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.showAll,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ) */),
            HorizontalGrid(
              isCategory: true,
            ),
            ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AllProductsSc.route_from_all);
                },
                leading: Text(
                  AppLocalizations.of(context)!.allProducts,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            VerticalGrid(),
          ],
        ),
      ),
    );
  }
}
