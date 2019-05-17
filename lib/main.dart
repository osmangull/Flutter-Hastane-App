import 'package:flutter/material.dart';

import 'admin/doktorEkle.dart';
import 'admin/doktorListele.dart';
import 'admin/hastaneekle.dart';
import 'admin/poliklinikEkle.dart';
import 'admin/poliklinikListele.dart';
import 'bottombar.dart';
import 'bottomicon.dart';
import 'data.dart';
import 'layout.dart';
import 'sayfalar/anasayfa.dart';
import 'sayfalar/favoriler.dart';
import 'sayfalar/profil.dart';
import 'sayfalar/randevular.dart';
import 'sayfalar/login.dart';
import 'package:hastaneguncel/admin/hastaneListele.dart';
void main() => runApp(LoginPage());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // ...
      title: '4 EVER 1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: '4 EVER 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key keyanasayfa = PageStorageKey('pageAnaSayfa');
  final Key keyfavoriler = PageStorageKey('pageFavoriler');
  final Key keyrandevular = PageStorageKey('pageRandevular');
  final Key keyprofile =PageStorageKey('pageProfile');

  int currentTab = 0;

  AnaSayfa anaSayfa;
  Profile profile;
  Favoriler favoriler;
  Randevular randevular;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dataList = [
      Data(1, true, "Hastane Adı-1"),
      Data(2, false, "Hastane Adı-2"),
      Data(3, false, "Hastane Adı-3"),
      Data(4, true, "Hastane Adı-4"),
      Data(5, false, "Hastane Adı-5"),
      Data(6, false, "Hastane Adı-6"),
      Data(7, false, "Hastane Adı-7"),
      Data(8, false, "Hastane Adı-8"),
      Data(9, false, "Hastane Adı-9"),
      Data(10, false, "Hastane Adı-10"),
      
    ];
    anaSayfa = AnaSayfa(
      key: keyanasayfa,
      
    );
    favoriler = Favoriler(
      key: keyfavoriler,
    );
    profile =Profile(
      key:keyprofile,
    );
    randevular = Randevular(
      key: keyrandevular,
    );

    pages = [anaSayfa, favoriler,randevular,profile];

    currentPage = anaSayfa;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4 EVER 1"),
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new ListTile(
            title: new Text(
              "4 EVER 1",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Divider(),
          new ListTile(
              title: new Text("Hastane Ekle"),
              trailing: new Icon(Icons.local_hospital),
              onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>HastaneEkle()));
              }),
          new ListTile(
            title: new Text("Hastane Listele"),
            trailing: new Icon(Icons.list),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>HastaneListe()));
              } ,
          ),
          Divider(),
          new ListTile(
            title: new Text("Poliklinik Ekle"),
            trailing: new Icon(Icons.add_circle),
                          onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>PoliklinikEkle()));
              }
          ),
          new ListTile(
            title: new Text("Poliklinik Listele"),
            trailing: new Icon(Icons.list),
              onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>PoliklinikListele()));

              }),
          Divider(),
          new ListTile(
            title: new Text("Doktor Ekle"),
            trailing: new Icon(Icons.add_to_queue),
                          onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>DoktorEkle()));
              }
          ),
          new ListTile(
            title: new Text("Doktor Listele"),
            trailing: new Icon(Icons.list),
                onTap: () {
                Navigator.of(context).pop;
                Navigator.of(context).push(new MaterialPageRoute(
                  builder:(BuildContext context)=>DoktorListele()));
                }),
          Divider(),
          new ListTile(
            title: new Text("Doktor İzni Ekle"),
            trailing: new Icon(Icons.add_comment),
          ),
          new ListTile(
            title: new Text("Doktor İzni Listele"),
            trailing: new Icon(Icons.view_list),
          ),
          Divider(),
          new ListTile(
            title: new Text("HAKKINDA"),
            trailing: new Icon(Icons.help),
          ),
        ]),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.purple,
        onTabSelected: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Ana Sayfa'),
          FABBottomAppBarItem(iconData: Icons.favorite, text: 'Favoriler'),
          FABBottomAppBarItem(iconData: Icons.date_range, text: 'Randevular'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Profilim'),
        ],
      ),

    );
  }
//buraya kadar
}