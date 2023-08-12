import 'package:flutter/material.dart';
import 'package:major_project/res/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:major_project/utils/routes/routes.dart';
import 'package:major_project/utils/routes/routes_name.dart';
import 'package:major_project/view_model/auth_view_model.dart';
import 'package:major_project/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Add ThemeProvider here
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
