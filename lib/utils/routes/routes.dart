import 'package:flutter/material.dart';
import 'package:major_project/res/components/bottom_nav_bar.dart';
import 'package:major_project/utils/routes/routes_name.dart';
import 'package:major_project/view/choice_view.dart';
import 'package:major_project/view/home_view.dart';
import 'package:major_project/view/login_view.dart';
import 'package:major_project/view/signup_view.dart';
import '../../view/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name){

      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.choice:
        return MaterialPageRoute(builder: (BuildContext context) =>  const ChoiceView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const BotNavBar());

      case RoutesName.botNavBar:
        return MaterialPageRoute(builder: (BuildContext context) => const BotNavBar());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}