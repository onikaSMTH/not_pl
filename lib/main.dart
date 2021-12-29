import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mini_project/components/floating_search_bar.dart';
import 'package:mini_project/l10n/l10n.dart';
import 'package:mini_project/providers/categories_provider.dart';
import 'package:mini_project/providers/local_language_provider.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/themes.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:mini_project/screens/add_product_sc.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:mini_project/screens/edit_profile_sc.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:mini_project/screens/login_signup_sc.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:mini_project/screens/search_sc.dart';
import 'package:mini_project/screens/side_sc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

//TODO make font size responsive to screen size
void main() {
 // SystemChrome.setPreferredOrientations(
   //   [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) {
            return Categories();
          }),
          ChangeNotifierProvider(create: (BuildContext context) {
            return Products();
          }),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return ThemeProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return LocalLanguageProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return CurrentUserToken();
            },
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              //text for material and Cupertino widgets
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              //fix widgets ltr and rtl
              GlobalWidgetsLocalizations.delegate
            ],
            locale: Provider.of<LocalLanguageProvider>(context).locale,
            themeMode: Provider.of<ThemeProvider>(context).currentThemeMode,
            darkTheme: Themes.darkTheme,
            theme: Themes.lightTheme,
            home: Nav(),
            routes: {
              ProductDetails.route: (_) => ProductDetails(),
              ProfileSc.route: (_) {
                return ProfileSc();
              },
              LoginSignupSc.signInRoute: (_) {
                return LoginSignupSc(
                  signup: false,
                );
              },
              LoginSignupSc.signUpRoute: (_) {
                return LoginSignupSc(
                  signup: true,
                );
              },
              SideSc.route: (_) => SideSc(),
              // ProductDetails.route : (_)=>ProductDetails(),
              AllProductsSc.route_from_fav: (_) => AllProductsSc(
                    appBarTitle: 'Your Favorites',
                    isFav: true,
                  ),
              AllProductsSc.route_from_all: (_) => AllProductsSc(
                    appBarTitle: 'All Products',
                    isAll: true,
                  ),
              SearchSc.route: (_) => SearchSc(),
              AddProductSc.route: (_) => AddProductSc(),
              Nav.route: (_) => Nav(),
              AllProductsSc.route_from_my: (_) => AllProductsSc(
                    appBarTitle: 'My Products',
                    isMy: true,
                  ),
              EditProfileSc.route: (_) => EditProfileSc()
            },
          );
        });
  }
}
