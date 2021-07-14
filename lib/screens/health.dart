import 'package:feed_me/constant/components.dart';
import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitnews, Statenews>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            defultcadr(Cubitnews.getdata(context).health[index], context),
        separatorBuilder: (BuildContext context, int index) =>
            defultdivider(context),
        itemCount: Cubitnews.getdata(context).health.length,
      ),
    );
  }
}
