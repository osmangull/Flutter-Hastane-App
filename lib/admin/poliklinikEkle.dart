import 'package:flutter/material.dart';


class PoliklinikData {
  String adi = '';
}
class PoliklinikEkle extends StatelessWidget {

  // This widget is the root of your application.
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
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {


static const List<String> hastane = const [
    'Hastane Seçiniz',
    'İzmir Devlet',
    'Manisa Özel',
    'Bozyaka SSK',
    'Nevvar Salih İşgören Hastanesi',
  ];


  String spinValue=hastane[0]; 

  @override
  Widget build(BuildContext context) {
    PoliklinikData doktor = PoliklinikData();
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "4 EVER 1",
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       new TextFormField(
                        decoration: new InputDecoration(
                            hintText: "Poliklinik Adini Giriniz.",
                            labelText: "Adi",
                            fillColor: Colors.white),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {doktor.adi=value;},
                      ),
                       new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                          new DropdownButton(   
                            isExpanded: true,
                            style: TextStyle(color:Colors.grey, fontSize: 18),
                            iconSize: 30,
                            value: spinValue,
                            onChanged: (string) => setState(() => spinValue = string),
                            items: hastane.map((string) {
                              return new DropdownMenuItem(
                                child: new Text(string),
                                value: string,
                                
                              );
                              
                            }).toList(),
                          ),

                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Poliklinik Ekle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
