import 'package:flutter/material.dart';

class HastaneListe extends StatefulWidget {
  @override
  HastaneListeleState createState() {
    return new HastaneListeleState();
  }
}

class HastaneListeleState extends State<HastaneListe> {
  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Hastane Adi"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.hastaneAdi.compareTo(b.hastaneAdi));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Bulunduğu Şehir"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.sehir.compareTo(b.sehir));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name.hastaneAdi),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                      DataCell(
                      Text(name.sehir),
                      showEditIcon: false,
                      placeholder: false,
                    )
                  ],
                ),
          )
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hastane Listesi"),
      ),
      body: Container(
        child: bodyData(),
      ),
    );
  }
}

class Name {
  String hastaneAdi;
  String sehir;

  Name({this.hastaneAdi,this.sehir});
}

var names = <Name>[
  Name(hastaneAdi:"Kadikoy",sehir: "İstanbul"),
  Name(hastaneAdi:"Bozyaka SSK",sehir: "İzmir"),
  Name(hastaneAdi:"İzmir Devlet",sehir: "İzmir"),
  Name(hastaneAdi:"Manisa Devlet",sehir: "Manisa"),
    Name(hastaneAdi:"Alsancak Tıp",sehir: "İzmir"),
];