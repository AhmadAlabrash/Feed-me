import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:feed_me/home.dart';
import 'package:feed_me/network/diohelper.dart';
import 'package:feed_me/network/sharedprefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Diohelper.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));

  await Cachehelper.initshared();
  bool lastmode = Cachehelper.getdata(word: 'themoflasttime');

  runApp(MyApp(lastmode));
}

class MyApp extends StatelessWidget {
  bool la;
  MyApp(this.la);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Cubitnews()..getall(),
        child: BlocConsumer<Cubitnews, Statenews>(
            listener: (BuildContext context, state) {
              if (state is Initstate) {
                Cubitnews.getdata(context).changemode(lastmode: la);
              }
            },
            builder: (BuildContext context, Object? state) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Home(),
                  theme: ThemeData(
                    primarySwatch: Colors.pink,
                    scaffoldBackgroundColor: Colors.white,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        elevation: 7, backgroundColor: Colors.white),
                    appBarTheme: AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        iconTheme: IconThemeData(color: Colors.pink)),
                  ),
                  darkTheme: ThemeData(
                    primarySwatch: Colors.deepOrange,
                    scaffoldBackgroundColor: Colors.grey,
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.grey[600],
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: Colors.grey[600],
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      iconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                    ),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.black,
                      elevation: 20.0,
                      backgroundColor: Colors.grey,
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  themeMode: Cubitnews.getdata(context).isdark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                )));
  }
}
