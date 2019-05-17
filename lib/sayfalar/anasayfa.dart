import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  
  AnaSayfa({
    Key key,
  }) : super(key: key);

  @override
  AnaSayfaState createState() => AnaSayfaState();
}

class AnaSayfaState extends State<AnaSayfa> {
  @override
 Widget build(BuildContext context) {
       return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                          new Image(
                          image: new AssetImage("images/hospital2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      new Text( 
                          "Uygulamamıza Hoş Geldiniz..",
                          style: TextStyle(color: Colors.deepPurple,fontStyle:FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold),
                      ),
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