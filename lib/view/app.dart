import 'package:app/repository/repository.dart';
import 'package:app/view/about.dart';

import 'package:app/view/ndef_write.dart';
import 'package:app/view/tag_read.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static Future<Widget> withDependency() async {
    final repo = await Repository.createInstance();
    return MultiProvider(
      providers: [
        Provider<Repository>.value(
          value: repo,
        ),
      ],
      child: App(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Home(),
      // theme: _themeData(Brightness.dark),
      // darkTheme: _themeData(Brightness.dark),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'NFC Batuno',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //   color: Color(0xFF009180),
                    // ),
                    boxShadow: [
                      //  bottom right is darker
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      //top left is lighter
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text("Read"),
                    trailing: Lottie.asset(
                      "assets/lottie/data.json",
                      height: 30,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TagReadPage.withDependency(),
                        )),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //   color: Color(0xFF009180),
                    // ),
                    boxShadow: [
                      //  bottom right is darker
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      //top left is lighter
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text("Write"),
                    trailing: Lottie.asset(
                      "assets/lottie/data.json",
                      height: 30,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NdefWritePage.withDependency(),
                        )),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //   color: Color(0xFF009180),
                    // ),
                    boxShadow: [
                      //  bottom right is darker
                      BoxShadow(
                        color: Color.fromARGB(63, 0, 145, 128),
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                      //top left is lighter
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text("About"),
                    trailing: Lottie.asset(
                      "assets/lottie/data.json",
                      height: 30,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              child: LottieBuilder.asset(
                "assets/lottie/50472-nfc-animation.json",
                // height: size.height / 2.5,
                // width: size.width / 2.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ThemeData _themeData(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    // Matches app icon color.
    primarySwatch: MaterialColor(0xFF4D8CFE, <int, Color>{
      50: Color(0xFFEAF1FF),
      100: Color(0xFFCADDFF),
      200: Color(0xFFA6C6FF),
      300: Color(0xFF82AFFE),
      400: Color(0xFF689DFE),
      500: Color(0xFF4D8CFE),
      600: Color(0xFF4684FE),
      700: Color(0xFF3D79FE),
      800: Color(0xFF346FFE),
      900: Color(0xFF255CFD),
    }),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      errorStyle: TextStyle(height: 0.75),
      helperStyle: TextStyle(height: 0.75),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(40),
    )),
    scaffoldBackgroundColor:
        brightness == Brightness.dark ? Colors.black : null,
    cardColor:
        brightness == Brightness.dark ? Color.fromARGB(255, 28, 28, 30) : null,
    dialogTheme: DialogTheme(
      backgroundColor: brightness == Brightness.dark
          ? Color.fromARGB(255, 28, 28, 30)
          : null,
    ),
    highlightColor:
        brightness == Brightness.dark ? Color.fromARGB(255, 44, 44, 46) : null,
    splashFactory: NoSplash.splashFactory,
  );
}
