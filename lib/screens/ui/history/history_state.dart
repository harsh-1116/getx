import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryState{




  String dateFormatter(){

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMM, yyyy');
    final String formatted = formatter.format(now);
    if (kDebugMode) {
      print("formatted=======>$formatted");
    }
    return formatted;


 }


}