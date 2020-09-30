import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff000080);

const BorderRadius kBorder = BorderRadius.only(
  bottomLeft: Radius.circular(32.0),
  bottomRight: Radius.circular(32.0),
);

const TextStyle kSkillTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 15.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const TextStyle kTitleTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 18.0,
  color: kPrimaryColor,
  letterSpacing: 2.5,
  fontWeight: FontWeight.bold,
);
