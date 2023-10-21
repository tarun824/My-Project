import 'package:flutter/material.dart';
import 'package:for_error/common/provider/is_loading_provider.dart';
import 'package:for_error/home_screen/pages/home_screen.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (jh) => UserProvider()),
        ChangeNotifierProvider(create: (jh) => IsLoadingProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<IsLoadingProvider>(builder: ((context, value, _) {
          return HomeScreen();
        })),
      ),
    );
  }
}
