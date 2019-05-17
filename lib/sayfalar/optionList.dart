import 'package:flutter/material.dart';

import '../main.dart';
import 'anasayfa.dart';

class OptionList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        buildTile(context, "Bilgilerimi Göster", Icons.info),
        buildTile(context, "Şifre Değiştir", Icons.lock),
        buildTile(context, "Bilgilerimi Düzenle", Icons.edit),
        buildTile(context, "Çıkış Yap", Icons.exit_to_app),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }




  Widget buildTile(BuildContext context, String title, IconData icon) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(title),
          leading: Icon(icon),
          trailing: Icon(Icons.navigate_next),
          onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp()
        ));
  },
        ),
        Divider(
          height: 6.0,
        ),
      ],
    );
  }
}
