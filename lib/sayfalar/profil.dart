import 'package:flutter/material.dart';
import 'package:hastaneguncel/sayfalar/optionList.dart';
import 'package:hastaneguncel/sayfalar/profileCard.dart';

class Profile extends StatefulWidget {
  
  Profile({
    Key key,
  }) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
 Widget build(BuildContext context) {
       return Scaffold(
      body: Column(

          children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                      ),
            ProfileCard(
              fullName: "Hasta Kamil",
              tcKimlik: "20089694574",
            ),
            OptionList(),
          ],
        ),
      );
  }
}