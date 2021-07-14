import 'package:feed_me/constant/components.dart';
import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class Sear extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       physics: BouncingScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) =>
//           defultcadr(Cubitnews.getdata(context).technology[index], context),
//       separatorBuilder: (BuildContext context, int index) =>
//           defultdivider(context),
//       itemCount: Cubitnews.getdata(context).technology.length,
//     );
//   }
// }
class Sear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitnews, Statenews>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Search',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search'),
                onFieldSubmitted: (val) {
                  print(val);
                  Cubitnews.getdata(context).getsearch(val);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (Cubitnews.getdata(context).search.length == 0)
              LinearProgressIndicator(),
            if (Cubitnews.getdata(context).search.length != 0)
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => defultcadr(
                      Cubitnews.getdata(context).search[index], context),
                  separatorBuilder: (BuildContext context, int index) =>
                      defultdivider(context),
                  itemCount: Cubitnews.getdata(context).search.length,
                ),
              ),
          ])),
    );
  }
}
