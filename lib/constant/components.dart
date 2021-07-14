import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defultcadr(article, context) => InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Web(article["url"])));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${article["urlToImage"]}'),
                  ),
                  borderRadius: BorderRadiusDirectional.circular(20)),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article["title"]}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${article["content"]}',
                    style: TextStyle(fontSize: 16, height: 1.4),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget defultdivider(context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Cubitnews.getdata(context).isdark ? Colors.black : Colors.grey,
      ),
    );
// ${article[""]}
