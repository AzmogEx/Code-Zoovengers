import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? verifPass(
  String? userInput,
  String? password,
) {
  // verif pass, verify if user entrance is == mdp
  password = 'password'; // replace with actual password
  userInput = 'userInput'; // replace with user input

  if (password == userInput) {
    return 'Password is correct';
  } else {
    return 'Password is incorrect';
  }
}
