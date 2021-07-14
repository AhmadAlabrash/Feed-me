// import 'package:chips/network/sharedprefrences.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   Diohelper.init();

//   await Cachehelper.initshared();
//   bool lastmode = Cachehelper.getdata(word: 'themoflasttime');
//   runApp(MyApp(lastmode));
// }

// class MyApp extends StatelessWidget {
//   var la;
//   MyApp(this.la);

//   @override
//   Widget build(BuildContext context) {
// return BlocProvider(
//   create: (BuildContext context) => Cubitnews()
//     // ..getall()
//     ..gettechnology(),
//   // ..getsport(),
//   // ..getscience()
//   // ..gethealth(),
//   child: BlocConsumer<Cubitnews, Statenews>(
//     listener: (BuildContext context, state) {
//       if (state is Initstate) {
//         Cubitnews.getdata(context).changemode(lastmode: la);
//       }
//     },
//     builder: (BuildContext context, Object? state) => MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Home(),
//           theme: ThemeData(
//             primarySwatch: Colors.deepOrange,
//             scaffoldBackgroundColor: Colors.white,
//             bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                 elevation: 7, backgroundColor: Colors.white),
//             appBarTheme: AppBarTheme(
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 iconTheme: IconThemeData(color: Colors.deepOrange)),
//           ),
//           darkTheme: ThemeData(
//             primarySwatch: Colors.cyan,
//             scaffoldBackgroundColor: Colors.grey[800],
//             bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                 selectedItemColor: Colors.white,
//                 elevation: 7,
//                 backgroundColor: Colors.grey[600]),
//             appBarTheme: AppBarTheme(
//                 backgroundColor: Colors.grey[600],
//                 elevation: 0,
//                 iconTheme: IconThemeData(color: Colors.black)),
//           ),
//           themeMode: Cubitnews.getdata(context).isdark
//               ? ThemeMode.dark
//               : ThemeMode.light,
//         ),
//       ),
//     );
//   }
// }
