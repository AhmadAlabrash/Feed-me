//import 'package:chips/news/search.dart';

import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:feed_me/sear.dart';
import 'package:feed_me/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitnews, Statenews>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) => Scaffold(
        body: Cubitnews.getdata(context)
            .allscreens[Cubitnews.getdata(context).currentindrx],
        appBar: AppBar(
          titleSpacing: 20.0,
          actions: [
            IconButton(
              onPressed: () => Cubitnews.getdata(context).changemode(),
              icon: Cubitnews.getdata(context).isdark
                  ? Icon(Icons.brightness_4)
                  : Icon(Icons.brightness_2),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Sear()));
                },
                icon: Icon(Icons.search)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                      leading: Icon(Icons.read_more),
                      title: Text('About'),
                      onTap: () {}),
                ),

                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Setting()));
                    },
                  ),
                ),
                // PopupMenuItem(
                //   child: ListTile(
                //     leading: Icon(Icons.science),
                //     title: Text('Science'),
                //     onTap: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Science()));
                //     },
                //   ),
                // ),
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Exit'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // const PopupMenuItem(child: Text('Item A')),
                // const PopupMenuItem(child: Text('Item B')),
              ],
            ),
            SizedBox(
              width: 9,
            )
          ],
          title: Text(
            'Feed me',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.search),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Sear()));
        //   },
        // ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 14,
          currentIndex: Cubitnews.getdata(context).currentindrx,
          onTap: (value) => Cubitnews.getdata(context).changenavbar(i: value),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'All',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.science),
              label: 'Technology',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports),
              label: 'Sports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.health_and_safety),
            //   label: 'Health',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.science),
              label: 'Science',
            ),
          ],
        ),
      ),
    );
  }
}
