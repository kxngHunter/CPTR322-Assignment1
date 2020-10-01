import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/constants.dart';

class Developer extends StatelessWidget {
  List skills = [
    'HTML/CSS',
    'PHP',
    'JavaScript',
    'Git & GitHub',
    'Database Storage (Sql, MySql, Mongoose, Firebase)',
    'Command Line'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.0,
                backgroundImage: const AssetImage('images/fresh.jpg'),
              ),
            ),
            Text(
              "Romain Hunter",
              style: const TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Software DEVELOPER".toUpperCase(),
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 18.0,
                color: Colors.orange[700],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: Divider(
                color: Colors.grey[600],
                height: 5.0,
              ),
            ),
            Text(
              'Full-Stack Web Developer'.toUpperCase(),
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 20.0),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    skills[index],
                    style: kSkillTextStyle,
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            Text('Mobile App Developer'.toUpperCase(), style: kTitleTextStyle),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Flutter & Dart',
                  style: kSkillTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Kotlin',
                  style: kSkillTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
