import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/components/clickable_search_icon.dart';
import 'package:mini_project/components/side_screen_languages_item.dart';
import 'package:mini_project/components/side_screen_theme_mode_item.dart';
import 'package:mini_project/components/sidesc_item.dart';
import 'package:mini_project/httpServices/user_http_service.dart';
import 'package:mini_project/providers/favorited_products.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:mini_project/screens/search_sc.dart';
import 'package:provider/provider.dart';
import '../data/side_items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideSc extends StatelessWidget {
  static const route = 'Side-screen';

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      //profile
      SideScItem(
          function: () {},
          icon: Icon(
            Icons.account_box,
            color: Theme.of(context).primaryColor,
          ),
          route: ProfileSc.route,
          text: AppLocalizations.of(context)!.profile,
          subtext: AppLocalizations.of(context)!.editYourInfo),
      //manage products
      SideScItem(
          function: () {},
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).primaryColor,
          ),
          route: AllProductsSc.route_from_my,
          text: AppLocalizations.of(context)!.manageProducts,
          subtext: AppLocalizations.of(context)!.addDeleteAndViewProducts),
      //favorites
      SideScItem(
          function: () {
            _updateFavoritedProducts(context);
          },
          icon: Icon(Icons.favorite, color: Colors.redAccent),
          route: AllProductsSc.route_from_fav,
          text: AppLocalizations.of(context)!.favorite,
          subtext: AppLocalizations.of(context)!.viewYourFavItems),
      //search
      SideScItem(
          function: () {},
          icon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
          route: SearchSc.route,
          text: AppLocalizations.of(context)!.search,
          subtext: AppLocalizations.of(context)!.searchForProducts),
      //all products
      SideScItem(
          function: () {},
          icon: Icon(
            Icons.ballot,
            color: Theme.of(context).primaryColor,
          ),
          route: AllProductsSc.route_from_all,
          text: AppLocalizations.of(context)!.allProducts,
          subtext: AppLocalizations.of(context)!.allProducts),
      // language dropdown list
      SideScLanguagesItem(),
      //change theme
      const SideScreenMode(),

      //TODO only show if user have loged in
      //logout
      Container(
        child: Provider.of<CurrentUserToken>(context).isUserLogedIn()
            ? SideScItem(
                function: () {
                  _logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).primaryColor,
                ),
                route: '',
                text: AppLocalizations.of(context)!.logout,
                subtext: '')
            : null,
      ),
    ];
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 5),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          }),
    );
  }

  _logout(BuildContext context) {
    UserHttpService().logoutUser(
        Provider.of<CurrentUserToken>(context, listen: false).getToken());
    Provider.of<CurrentUserToken>(context, listen: false).userLogedOut();
    print(
        Provider.of<CurrentUserToken>(context, listen: false).isUserLogedIn());
  }

  _updateFavoritedProducts(BuildContext context) async {
     await UserHttpService()
        .userFavoritesProducts(
            Provider.of<CurrentUserToken>(context, listen: false).getToken())
        .then((favoritedProductrs) {
      Provider.of<FavoritedProducts>(context, listen: false)
          .setProducts(favoritedProductrs);
    });
  }
}
