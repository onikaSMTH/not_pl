import 'package:flutter/material.dart';
import 'package:mini_project/screens/all_products_sc.dart';
import 'package:mini_project/screens/navigation_main_sc.dart';
import 'package:mini_project/screens/login_signup_sc.dart';
import 'package:mini_project/screens/product_details_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:mini_project/screens/side_sc.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
      routes:{
        ProfileSc.route:(_){return ProfileSc();},
LoginSignupSc.signInRoute:(_){return LoginSignupSc(signup: false,);},
LoginSignupSc.signUpRoute:(_){return LoginSignupSc(signup: true,);},
        SideSc.route:(_)=> SideSc(),
       // ProductDetails.route : (_)=>ProductDetails(),
        AllProductsSc.route:(_)=>AllProductsSc(),
      },
    );
  }
}

