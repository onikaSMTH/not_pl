import 'package:flutter/material.dart';
import 'package:mini_project/screens/nav.dart';
import 'package:mini_project/screens/login_sc.dart';
import 'package:mini_project/screens/profile_sc.dart';
import 'package:mini_project/screens/sidesc.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
      routes:{
        ProfileSc.route:(_){return ProfileSc();},
LoginSignupSc.SigninRoute:(_){return LoginSignupSc(signup: false,);},
LoginSignupSc.SignupRoute:(_){return LoginSignupSc(signup: true,);},
        SideSc.route:(_)=> SideSc(),
      },
    );
  }
}

