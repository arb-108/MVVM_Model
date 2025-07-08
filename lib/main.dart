import 'package:app_mvvm/res/theme.dart';
import 'package:app_mvvm/utils/routes/routes.dart';
import 'package:app_mvvm/utils/routes/routesName.dart';
import 'package:app_mvvm/view_model/auth_view_model.dart';
import 'package:app_mvvm/view_model/movies_view_model.dart';
import 'package:app_mvvm/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=>AuthViewModel()),
      ChangeNotifierProvider(create: (_)=>userViewModel()),
      ChangeNotifierProvider(create: (_){
        final provider = moviesViewModel();
        provider.fetchMoviesApi(); // Call the API here
        return provider;
      }),

    ],child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme:darkMode,
      themeMode: ThemeMode.system,

      initialRoute: routesName.splash,
      onGenerateRoute:Routes.ongenerate,
    )
    );
  }
}

