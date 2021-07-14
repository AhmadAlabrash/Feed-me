import 'package:feed_me/all.dart';
import 'package:feed_me/cubit/state.dart';
import 'package:feed_me/network/diohelper.dart';
import 'package:feed_me/network/sharedprefrences.dart';
import 'package:feed_me/screens/economer.dart';
import 'package:feed_me/screens/health.dart';
import 'package:feed_me/screens/news.dart';
import 'package:feed_me/screens/science.dart';
import 'package:feed_me/screens/sport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cubitnews extends Cubit<Statenews> {
  // ignore: not_initialized_non_nullable_instance_field
  Cubitnews() : super(Initstate());
  static Cubitnews getdata(context) => BlocProvider.of(context);

  var currentindrx = 0;
  bool isdark = false;
  List<Widget> allscreens = [
    All(),
    News(),
    Sport(),
    Economer(),
    Health(),
    Science()
  ];
  List<dynamic> technology = [];
  List<dynamic> economer = [];
  List<dynamic> sport = [];
  List<dynamic> science = [];
  List<dynamic> all = [];
  List<dynamic> health = [];
  List<dynamic> search = [];

  void changenavbar({var i}) {
    currentindrx = i;
    emit(Changenav());
    onchange();
  }

  void changemode({lastmode}) {
    if (lastmode == null) {
      isdark = !isdark;

      Cachehelper.putdata(word: 'themoflasttime', val: isdark).then((value) {
        emit(Savedsharedsuccess());
      }).catchError((error) {
        print('The Error now is $error');
        emit(Savedsharedfailed());
      });
    } else {
      if (lastmode == false) {
        isdark = false;
      } else {
        isdark = true;
      }
    }
  }

  void onchange() {
    if (currentindrx == 0) {
      getall();
      emit(Getsport());
    }
    if (currentindrx == 1) {
      gettechnology();
      emit(Gettexhnology());
    }
    if (currentindrx == 2) {
      getsport();
      emit(Getsport());
    }
    if (currentindrx == 3) {
      geteconomer();
      emit(Getbusiness());
    }
  }

  void getscience() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'us',
      'category': 'science',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      science = value.data['articles'];
      emit(Sciencesuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Sciencefailed());
    });
  }

  void getall() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'tr',
      'category': 'general',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      all = value.data['articles'];
      emit(Allsuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Allfailed());
    });
  }

  void gethealth() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'fr',
      'category': 'health',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      health = value.data['articles'];
      emit(Healthsuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Healthfailed());
    });
  }

  void gettechnology() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'us',
      'category': 'technology',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      technology = value.data['articles'];
      emit(Technologysuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Technologyfailed());
    });
  }

  void getsport() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'br',
      'category': 'sport',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      sport = value.data['articles'];
      emit(Sportsuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Sportfailed());
    });
  }

  void geteconomer() {
    Diohelper.getdata('v2/top-headlines', queries: {
      'country': 'us',
      'category': 'business',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      economer = value.data['articles'];
      emit(Businesssuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Businessfailed());
    });
  }

  void getsearch(word) {
    Diohelper.getdata('v2/everything', queries: {
      'q': '$word',
      'apikey': 'ef1c4e395ae147f5a14309c951242e40'
    }).then((value) {
      search = value.data['articles'];
      emit(Searchsuccess());
    }).catchError((error) {
      print('We Have An Error With $error');
      emit(Searchfailed());
    });
  }
}
