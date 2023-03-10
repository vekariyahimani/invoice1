import 'package:flutter/material.dart';
import 'package:invoice1/bill.dart';
import 'package:invoice1/page1.dart';


void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Page1(),
        'bill':(context) => bill(),
      },
    )
  );
}