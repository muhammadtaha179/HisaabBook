import 'package:flutter/material.dart';
import 'package:loan_app/DBHelper.dart';
import 'package:loan_app/add_hisaab.dart';
import 'package:loan_app/add_hisaab_entry.dart';
import 'package:loan_app/home.dart';
import 'package:loan_app/sign_up.dart';
import 'package:sqflite/sqflite.dart';

import 'login.dart';
late DBHelper dbHelper;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   dbHelper = await DBHelper().openDB();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    )
  );
}