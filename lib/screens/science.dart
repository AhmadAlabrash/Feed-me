import 'package:conditional_builder/conditional_builder.dart';
import 'package:feed_me/constant/components.dart';
import 'package:feed_me/cubit/cubit.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitnews, Statenews>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) => ConditionalBuilder(
            condition: Cubitnews.getdata(context).science.length != 0,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => defultcadr(
                      Cubitnews.getdata(context).science[index], context),
                  separatorBuilder: (BuildContext context, int index) =>
                      defultdivider(context),
                  itemCount: Cubitnews.getdata(context).science.length,
                )));
  }
}
