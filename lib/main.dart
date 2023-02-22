import 'package:flutter/material.dart';
import 'package:flutterwidgets/home_page.dart';
import 'package:flutterwidgets/routes.dart';
import 'package:flutterwidgets/widgets/test_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Color(0xFFffffff)),
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: '',
        appBarTheme: const AppBarTheme(
            // color: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansLao',
                fontWeight: FontWeight.normal,
                fontSize: 18)),
      ),
      home: const MyHomePage(),
      routes: routes(context),
      // home: const TestWidget(),
    );
  }
}
